import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MarksPredictionProvider extends ChangeNotifier {
  String image = "";
  double marks = 0;
  bool isLoading = false;

  Future<void> getMarks() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse("https://demo-krh2.onrender.com/predict"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"study_hours": 5}),
      );

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        image = decodedData['image_url'];
        marks = decodedData['predicted_marks'];
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
