import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart ' as http;


import 'package:flutter/material.dart';
class MarksPredictionScreen extends StatefulWidget {
  const MarksPredictionScreen({super.key});

  @override
  State<MarksPredictionScreen> createState() => _MarksPredictionScreenState();
}

class _MarksPredictionScreenState extends State<MarksPredictionScreen> {
  Future<void> getMarks() async {
    Map<String, dynamic> data = {"study_hours": 5};
    var encodedData = jsonEncode(data);

    final response = await http.post(
      Uri.parse("https://demo-krh2.onrender.com/predict"),
      headers: {"Content-Type": "application/json"},
      body: encodedData,
    );
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      print('Response data: $decodedData');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: getMarks, child: Text("marks"))
        ],

      ),
    );
  }
}
