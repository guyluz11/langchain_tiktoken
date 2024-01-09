import 'dart:convert';

import 'package:langchain_tiktoken/src/common/byte_array.dart';

import 'ranks/index.dart' as ranks;

import 'ranks/cl100k_base/cl100k_base_1.g.dart';
import 'ranks/cl100k_base/cl100k_base_2.g.dart';
import 'ranks/cl100k_base/cl100k_base_3.g.dart';
import 'ranks/cl100k_base/cl100k_base_4.g.dart';
import 'ranks/cl100k_base/cl100k_base_5.g.dart';
import 'ranks/cl100k_base/cl100k_base_6.g.dart';
import 'ranks/cl100k_base/cl100k_base_7.g.dart';
import 'ranks/cl100k_base/cl100k_base_8.g.dart';
import 'ranks/cl100k_base/cl100k_base_9.g.dart';
import 'ranks/cl100k_base/cl100k_base_10.g.dart';
import 'ranks/cl100k_base/cl100k_base_11.g.dart';

// ignore: constant_identifier_names
const ENDOFTEXT = "<|endoftext|>";

// ignore: constant_identifier_names
const FIM_PREFIX = "<|fim_prefix|>";

// ignore: constant_identifier_names
const FIM_MIDDLE = "<|fim_middle|>";

// ignore: constant_identifier_names
const FIM_SUFFIX = "<|fim_suffix|>";

// ignore: constant_identifier_names
const ENDOFPROMPT = "<|endofprompt|>";

class CoreBPEConstructor {
  const CoreBPEConstructor._({
    required this.name,
    required this.patStr,
    required this.mergeableRanks,
    required this.specialTokens,
    this.explicitNVocab,
  });

  // factory CoreBPEConstructor.gpt2() {
  //   return CoreBPEConstructor._(
  //     name: "gpt2",
  //     explicitNVocab: 50257,
  //     patStr:
  //         r"'s|'t|'re|'ve|'m|'ll|'d| ?\p{L}+| ?\p{N}+| ?[^\s\p{L}\p{N}]+|\s+(?!\S)|\s+",
  //     mergeableRanks: ranks.gpt2.map(
  //       (k, v) => MapEntry(ByteArray.fromList(base64Decode(k)), v),
  //     ),
  //     specialTokens: {ENDOFTEXT: 50256},
  //   );
  // }

  // factory CoreBPEConstructor.r50kBase() {
  //   return CoreBPEConstructor._(
  //     name: "r50k_base",
  //     explicitNVocab: 50257,
  //     patStr:
  //         r"""'s|'t|'re|'ve|'m|'ll|'d| ?\p{L}+| ?\p{N}+| ?[^\s\p{L}\p{N}]+|\s+(?!\S)|\s+""",
  //     mergeableRanks: ranks.r50kBase.map(
  //       (k, v) => MapEntry(ByteArray.fromList(base64Decode(k)), v),
  //     ),
  //     specialTokens: {ENDOFTEXT: 50256},
  //   );
  // }

  // factory CoreBPEConstructor.p50kBase() {
  //   return CoreBPEConstructor._(
  //     name: "p50k_base",
  //     explicitNVocab: 50281,
  //     patStr:
  //         r"""'s|'t|'re|'ve|'m|'ll|'d| ?\p{L}+| ?\p{N}+| ?[^\s\p{L}\p{N}]+|\s+(?!\S)|\s+""",
  //     mergeableRanks: ranks.p50kBase.map(
  //       (k, v) => MapEntry(ByteArray.fromList(base64Decode(k)), v),
  //     ),
  //     specialTokens: {ENDOFTEXT: 50256},
  //   );
  // }

  // factory CoreBPEConstructor.p50kEdit() {
  //   return CoreBPEConstructor._(
  //     name: "p50k_edit",
  //     patStr:
  //         r"""'s|'t|'re|'ve|'m|'ll|'d| ?\p{L}+| ?\p{N}+| ?[^\s\p{L}\p{N}]+|\s+(?!\S)|\s+""",
  //     mergeableRanks: ranks.p50kBase.map(
  //       (k, v) => MapEntry(ByteArray.fromList(base64Decode(k)), v),
  //     ),
  //     specialTokens: {
  //       ENDOFTEXT: 50256,
  //       FIM_PREFIX: 50281,
  //       FIM_MIDDLE: 50282,
  //       FIM_SUFFIX: 50283
  //     },
  //   );
  // }

  factory CoreBPEConstructor.cl100kBase() {
    Map<String, int> cl100kBase = cl100kBase1;
    cl100kBase.addAll(cl100kBase2);
    cl100kBase.addAll(cl100kBase3);
    cl100kBase.addAll(cl100kBase4);
    cl100kBase.addAll(cl100kBase5);
    cl100kBase.addAll(cl100kBase6);
    cl100kBase.addAll(cl100kBase7);
    cl100kBase.addAll(cl100kBase8);
    cl100kBase.addAll(cl100kBase9);
    cl100kBase.addAll(cl100kBase10);
    cl100kBase.addAll(cl100kBase11);

    return CoreBPEConstructor._(
      name: "cl100k_base",
      patStr:
          r"(\?i:'s|'t|'re|'ve|'m|'ll|'d)|[^\r\n\p{L}\p{N}]?\p{L}+|\p{N}{1,3}| ?[^\s\p{L}\p{N}]+[\r\n]*|\s*[\r\n]+|\s+(?!\S)|\s+",
      mergeableRanks: ranks.cl100kBase.map(
        (k, v) => MapEntry(ByteArray.fromList(base64Decode(k)), v),
      ),
      specialTokens: {
        ENDOFTEXT: 100257,
        FIM_PREFIX: 100258,
        FIM_MIDDLE: 100259,
        FIM_SUFFIX: 100260,
        ENDOFPROMPT: 100276,
      },
    );
  }

  final String name;
  final String patStr;
  final Map<ByteArray, int> mergeableRanks;
  final Map<String, int> specialTokens;
  final int? explicitNVocab;

  static const all = {
    "gpt2",
    "r50k_base",
    "p50k_base",
    "p50k_edit",
    "cl100k_base",
  };
}
