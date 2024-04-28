import 'package:flutter/material.dart';
import 'package:gdsc_tech_nova/Presentation/HomeScreen/home_screen.dart';
import 'package:gdsc_tech_nova/Presentation/TextRecognition/text_regonition_screen.dart';
import 'package:gdsc_tech_nova/Provider/OcrProvider.dart';
import 'package:gdsc_tech_nova/Provider/SpeechProvider.dart';
import 'package:gdsc_tech_nova/utils/app_colors..dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OCRProvider()),
        ChangeNotifierProvider(create: (context) => SpeechRecognizerProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: TextRegonitionScreen(),
      ),
    );
  }
}
