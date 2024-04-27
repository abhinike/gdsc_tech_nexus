import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MarksPredictionScreen extends StatefulWidget {
  const MarksPredictionScreen({Key? key}) : super(key: key);

  @override
  _MarksPredictionScreenState createState() => _MarksPredictionScreenState();
}

class _MarksPredictionScreenState extends State<MarksPredictionScreen> {
  String image = "";
  double marks = 0;
  bool isLoading = false;

  Future<void> getMarks() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse("https://demo-krh2.onrender.com/predict"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"study_hours": 5}),
      );

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        setState(() {
          image = decodedData['image_url'];
          marks = decodedData['predicted_marks'];
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');

    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: isLoading ? null : getMarks,
            child: Text("Get Marks"),
          ),
          SizedBox(height: 16),
          if (isLoading)
            CircularProgressIndicator()
          else
            Text("Predicted Marks: $marks"),
          SizedBox(height: 16),
          if (image.isNotEmpty) Image.network(image),
        ],
      ),
    );
  }
}
