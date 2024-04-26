import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechRecognizerProvider extends ChangeNotifier {
  // example for reference (you may wirte your own )
  SpeechToText _speech = SpeechToText();
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;

  bool get isListening => _isListening;
  String get text => _text;
  double get confidence => _confidence;

  // void start() => _speech
  //     .listen(locale: 'en_US')
  //     .then((result) => print('Result: $result'));

  // void stop() => _speech.stop().then((result) => print('Result: $result'));

  // void cancel() => _speech.cancel().then((result) => print('Result: $result'));

  void start() async {
    if (!isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        onListening(true);
        _speech.listen(
          onResult: (val) {
            onResult(val.recognizedWords);
            if (val.hasConfidenceRating && val.confidence > 0) {
              confidenceLevel(val.confidence);
            }
          },
          localeId: 'en_US',
          onSoundLevelChange: (val) => print('onSoundLevelChange: $val'),
        );
      } else {
        stop();
      }
    }
  }

  void stop() {
    if (isListening) {
      _speech.stop();
      onListening(false);
    }
  }

  void confidenceLevel(double confidence) {
    _confidence = confidence;
    notifyListeners();
  }

  void onResult(String text) {
    _text = text;
    notifyListeners();
    print(text);
  }

  void onListening(bool isListening) {
    _isListening = isListening;
    notifyListeners();
  }
}
