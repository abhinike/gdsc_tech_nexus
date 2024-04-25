import 'package:flutter/material.dart';
import 'package:gdsc_tech_nova/Presentation/SpeechRecognition/speech_recognition_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(child: ListView(
        children: [
          ListTile(
            title: const Text('Speech recognition'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const SpeechRecognitionScreen()));
            },
          ),
          
        ],
      )),
    );
  }
}
