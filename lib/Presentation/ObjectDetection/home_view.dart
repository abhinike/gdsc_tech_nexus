import 'package:flutter/material.dart';
import 'package:gdsc_tech_nova/Presentation/ObjectDetection/detector_widget.dart';
import 'package:gdsc_tech_nova/utils/app_colors..dart';
import 'package:gdsc_tech_nova/utils/screen_params.dart';

/// [HomeView] stacks [DetectorWidget]
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenParams.screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      key: GlobalKey(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title:  Text("Live Object Detection", style: TextStyle(color: AppColors.backgroundColor, fontSize: 20, fontWeight: FontWeight.bold),)
      ),
      body: const DetectorWidget(),
    );
  }
}
