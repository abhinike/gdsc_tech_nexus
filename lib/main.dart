import 'package:flutter/material.dart';
import 'package:gdsc_tech_nova/Presentation/HomeScreen/home_screen.dart';
import 'package:gdsc_tech_nova/Provider/MarksPredictionProvider.dart';
import 'package:gdsc_tech_nova/Provider/SpeechProvider.dart';
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
        ChangeNotifierProvider(create: (context) => SpeechRecognizerProvider()),
        ChangeNotifierProvider(create: (context) => MarksPredictionProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        
        home: HomeScreen(),
        
      ),
    );
  }
}
