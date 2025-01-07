import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';


import '../../constants/colors.dart';
import '../../controller/api_controller.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatBotPage> {
  final ApiController controller = Get.put(ApiController());
  late final GenerativeModel _model;
  late final GenerativeModel _visionModel;
  late final ChatSession _chat;

  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _chatHistory = [];
  String? _file;

  @override
  void initState() {
    _model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: controller.geminiAPI.value,
    );
    _visionModel = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: controller.geminiAPI.value,
    );
    _chat = _model.startChat();
    super.initState();
  }

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      setState(() {
        _file = result.files.first.path;
      });
    }
  }

  void _sendMessage() {
    setState(() {
      if (_chatController.text.isNotEmpty) {
        if (_file != null) {
          _chatHistory.add({
            "time": DateTime.now(),
            "message": _file,
            "isSender": true,
            "isImage": true,
          });
        }

        _chatHistory.add({
          "time": DateTime.now(),
          "message": _chatController.text,
          "isSender": true,
          "isImage": false,
        });

        getAnswer(_chatController.text);
        _chatController.clear();
      }
    });

    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  void getAnswer(String text) async {
    late final response;
    if (_file != null) {
      final firstImage = await File(_file!).readAsBytes();
      final prompt = TextPart(text);
      final imageParts = [
        DataPart('image/jpeg', firstImage),
      ];
      response = await _visionModel.generateContent([
        Content.multi([prompt, ...imageParts]),
      ]);
      _file = null;
    } else {
      var content = Content.text(text);
      response = await _chat.sendMessage(content);
    }

    setState(() {
      _chatHistory.add({
        "time": DateTime.now(),
        "message": response.text,
        "isSender": false,
        "isImage": false,
      });
    });

    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat AI", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 160,
            child: ListView.builder(
              itemCount: _chatHistory.length,
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  child: Align(
                    alignment: (_chatHistory[index]["isSender"] ? Alignment.topRight : Alignment.topLeft),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: (_chatHistory[index]["isSender"] ? AppColorsDark.third : Colors.grey),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: _chatHistory[index]["isImage"]
                          ? Image.file(File(_chatHistory[index]["message"]), width: 200)
                          : Text(
                        _chatHistory[index]["message"],
                        style: TextStyle(
                          fontSize: 15,
                          color: _chatHistory[index]["isSender"] ? Colors.white : Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  MaterialButton(
                    onPressed: _pickImage,
                    minWidth: 42.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        color: AppColorsDark.third,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(minWidth: 42.0, minHeight: 36.0),
                        alignment: Alignment.center,
                        child: Icon(_file == null ? Icons.image : Icons.check, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: AppColorsDark.third, width: 2.0),
                          bottom: BorderSide(color: AppColorsDark.third, width: 2.0),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Type a message",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                          controller: _chatController,
                          onSubmitted: (value) {
                            _sendMessage();
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  MaterialButton(
                    onPressed: _sendMessage,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        color: AppColorsDark.third,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                        alignment: Alignment.center,
                        child: const Icon(Icons.send, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}