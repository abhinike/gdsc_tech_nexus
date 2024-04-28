import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/MarksPredictionProvider.dart'; // Import the MarksPredictionProvider

class MarksPredictionScreen extends StatelessWidget {
  const MarksPredictionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MarksPredictionProvider>(
        builder: (context, provider, _) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: provider.isLoading ? null : provider.getMarks,
              child: Text("Get Marks"),
            ),
            SizedBox(height: 16),
            if (provider.isLoading)
              CircularProgressIndicator()
            else
              Text("Predicted Marks: ${provider.marks}"),
            SizedBox(height: 16),
            if (provider.image.isNotEmpty) Image.network(provider.image),
          ],
        ),
      ),
    );
  }
}
