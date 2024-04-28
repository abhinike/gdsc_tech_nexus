import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class OCRProvider extends ChangeNotifier {
  final TextEditingController textEditingController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();

  // Function to capture image from camera
  Future<void> captureImageFromCamera() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      await recognizeText(image.path);
    }
  }

  // Function to pick image from gallery
  Future<void> pickImageFromFile() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      await recognizeText(image.path);
    }
  }

  // Function to recognize text from image and set it to the textEditingController
  Future<void> recognizeText(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final textRecognizer = TextRecognizer();
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    String extractedText = '';

    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        extractedText += '${line.text}\n';
      }
    }

    if (extractedText.isEmpty) {
      extractedText = 'No text recognized';
    }

    textEditingController.text = extractedText;

    textRecognizer.close();
    notifyListeners();
  }

  // Function to copy result to clipboard
  bool copyToClipboard() {
    final String text = textEditingController.text;
    if (text.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: text));
      return true;
    }
    return false;
  }
}
