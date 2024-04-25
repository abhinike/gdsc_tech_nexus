

import 'package:flutter/material.dart';


class SpeechRecognitionScreen extends StatefulWidget {
  const SpeechRecognitionScreen({Key? key}) : super(key: key);

  @override
  State<SpeechRecognitionScreen> createState() => _SpeechRecognitionScreenState();
}

class _SpeechRecognitionScreenState extends State<SpeechRecognitionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech Recognition'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Add your code here
              },
              child: Text('Start Listening'),
            ),
          ],
        ),
      ),
    );
  }
}