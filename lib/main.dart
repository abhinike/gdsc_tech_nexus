import 'package:flutter/material.dart';
import 'package:gdsc_tech_nova/Presentation/HomeScreen/home_screen.dart';
import 'package:gdsc_tech_nova/Presentation/ObjectDetection/home_view.dart';
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
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        
        home: HomeView(),
        
      ),
    );
  }
}
