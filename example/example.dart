import 'dart:typed_data';

import 'package:langchain_tiktoken/langchain_tiktoken.dart';

void main() {
// Load an encoding
  Tiktoken tiktoken = encodingForModel("t5");

  String decodeString = tiktoken.decode(
    [
      947,
      19,
      3,
      9,
      418,
      13,
      1499,
      27,
      278,
      31,
      17,
      241,
      12,
      608,
      3,
      1825,
      58,
      1,
    ],
  );

  print('decodeString');
  print(decodeString);
  print('');
// Tokenize text

  Uint32List encodedList =
      tiktoken.encode("Here is a lot of text I don't want to read ok?");

  print(encodedList);
  print(tiktoken.decode(encodedList));
  print('object');
}
