import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_tech_nova/Provider/SpeechProvider.dart';
import 'package:gdsc_tech_nova/utils/app_colors..dart';
import 'package:gdsc_tech_nova/utils/list_constants.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:provider/provider.dart';

class SpeechRecognitionScreen extends StatefulWidget {
  const SpeechRecognitionScreen({Key? key}) : super(key: key);

  @override
  State<SpeechRecognitionScreen> createState() =>
      _SpeechRecognitionScreenState();
}

class _SpeechRecognitionScreenState extends State<SpeechRecognitionScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SpeechRecognizerProvider>(
      builder: (context, SpeechRecognizerProvider speechRecognizerProvider,
          Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.secondaryColor,
            foregroundColor: AppColors.backgroundColor,
            centerTitle: true,
            title: Text(
                'Confidence: ${speechRecognizerProvider.confidence * 100}%',
                style: TextStyle(
                  color: AppColors.backgroundColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: AvatarGlow(
            animate: speechRecognizerProvider.isListening,
            glowColor: AppColors.secondaryColor,
            glowRadiusFactor: 0.75,
            duration: const Duration(milliseconds: 2000),
            repeat: true,
            child: FloatingActionButton(
              shape: CircleBorder(),
              backgroundColor: AppColors.secondaryColor,
              foregroundColor: AppColors.backgroundColor,
              onPressed: () {
                speechRecognizerProvider.isListening
                    ? speechRecognizerProvider.stop()
                    : speechRecognizerProvider.start();
              },
              child: speechRecognizerProvider.isListening
                  ? const Icon(Icons.mic)
                  : const Icon(Icons.mic_none),
            ),
          ),
          body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: TextHighlight(
                    text: speechRecognizerProvider.text,
                    textStyle: const TextStyle(
                        fontSize: 32.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    words: listConstants),
              ),
            ),
          ),
        );
      },
    );
  }
}
