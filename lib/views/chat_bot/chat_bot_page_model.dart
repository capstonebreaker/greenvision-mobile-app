import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import '../../constants/colors.dart';
import '../../controller/api_controller.dart';

class ChatBotPageModel extends StatefulWidget {
  const ChatBotPageModel({super.key});

  @override
  State<ChatBotPageModel> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatBotPageModel> {
  final ApiController controller = Get.put(ApiController());
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _chatHistory = [];
  String? _file;
  bool _isTyping = false;


  @override
  void initState() {
    super.initState();
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

        // Show typing indicator before getting answer
        _isTyping = true;
        getAnswer(_chatController.text);
        _chatController.clear();
      }
    });

    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void getAnswer(String text) async {
    try {
      final response = await http.post(
        Uri.parse(controller.chatBotAPI.value),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"prompt": text}),
      );

      setState(() {
        _isTyping = false;  // Hide typing indicator

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          _chatHistory.add({
            "time": DateTime.now(),
            "message": data["response"],
            "isSender": false,
            "isImage": false,
          });
        } else {
          _chatHistory.add({
            "time": DateTime.now(),
            "message": "Error: ${response.reasonPhrase}",
            "isSender": false,
            "isImage": false,
          });
        }
      });
    } catch (e) {
      setState(() {
        _isTyping = false;
        _chatHistory.add({
          "time": DateTime.now(),
          "message": "Error: $e",
          "isSender": false,
          "isImage": false,
        });
      });
    }

    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
            "Paddy ChatBot",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 160,
            child: ListView.builder(
              itemCount: _chatHistory.length + (_isTyping ? 1 : 0),
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == _chatHistory.length && _isTyping) {
                  return TypingIndicator();
                }

                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  child: Align(
                    alignment: (_chatHistory[index]["isSender"]
                        ? Alignment.topRight
                        : Alignment.topLeft),
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
                        color: (_chatHistory[index]["isSender"]
                            ? AppColorsDark.third
                            : Colors.grey),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: _chatHistory[index]["isImage"]
                          ? Image.file(File(_chatHistory[index]["message"]),
                          width: 200)
                          : Text(
                        _chatHistory[index]["message"],
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
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
              margin: const EdgeInsets.only(bottom: 15.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
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
                            hintStyle: TextStyle(color: Colors.black),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                          style: const TextStyle(color: Colors.black),
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        color: AppColorsDark.third,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                            minWidth: 88.0,
                            minHeight: 36.0),
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

class TypingIndicator extends StatefulWidget {
  @override
  _TypingIndicatorState createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _currentDot = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..addListener(() {
      setState(() {
        _currentDot = (_controller.value * 3).floor();
      });
    });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Align(
        alignment: Alignment.topLeft,
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
            color: Colors.grey,
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _currentDot == index ? 1.0 : 0.4,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 4,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}