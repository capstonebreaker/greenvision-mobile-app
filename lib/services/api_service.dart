import 'package:cloud_firestore/cloud_firestore.dart';

class ApiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> fetchAPIData(String documentId) async {
    try {
      DocumentSnapshot document = await _firestore
          .collection('api')
          .doc(documentId)
          .get();

      if (document.exists) {
        return document.data() as Map<String, dynamic>;
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
