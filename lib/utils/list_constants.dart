import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';

final Map<String, HighlightedWord> listConstants = {
  'flutter': HighlightedWord(
    onTap: () => print('flutter'),
    textStyle: const TextStyle(
        color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 32),
  ),
  'ML': HighlightedWord(
    onTap: () => print('dart'),
    textStyle: const TextStyle(
        color: Colors.green, fontWeight: FontWeight.bold, fontSize: 32),
  ),
  'machine learning': HighlightedWord(
    onTap: () => print('dart'),
    textStyle: const TextStyle(
        color: Colors.green, fontWeight: FontWeight.bold, fontSize: 32),
  ),
  'GDSC': HighlightedWord(
    onTap: () => print('dart'),
    textStyle: const TextStyle(
        color: Colors.red, fontWeight: FontWeight.bold, fontSize: 32),
  ),
  'gdsc': HighlightedWord(
    onTap: () => print('dart'),
    textStyle: const TextStyle(
        color: Colors.red, fontWeight: FontWeight.bold, fontSize: 32),
  ),
};
