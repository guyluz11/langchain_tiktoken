import 'dart:convert';

import 'package:langchain_tiktoken/src/common/byte_array.dart';
import 'package:langchain_tiktoken/src/ranks/index.dart';

// import 'ranks/index.dart' as ranks;

import 'ranks/cl100k_base/cl100k_base_1.g.dart';
import 'ranks/cl100k_base/cl100k_base_10.g.dart';
import 'ranks/cl100k_base/cl100k_base_11.g.dart';
import 'ranks/cl100k_base/cl100k_base_2.g.dart';
import 'ranks/cl100k_base/cl100k_base_3.g.dart';
import 'ranks/cl100k_base/cl100k_base_4.g.dart';
import 'ranks/cl100k_base/cl100k_base_5.g.dart';
import 'ranks/cl100k_base/cl100k_base_6.g.dart';
import 'ranks/cl100k_base/cl100k_base_7.g.dart';
import 'ranks/cl100k_base/cl100k_base_8.g.dart';
import 'ranks/cl100k_base/cl100k_base_9.g.dart';

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

  factory CoreBPEConstructor.t5Base() {
    final Map<String, int> base = t5BaseMap;

    return CoreBPEConstructor._(
      name: "t5_base",
      patStr: r"\S+|\s+",
      mergeableRanks: base.map(
        (k, v) => MapEntry(ByteArray.fromList(base64Decode(k)), v),
      ),
      specialTokens: {
        "▁": 3,
        "<extra_id_0>": 100000,
        "<extra_id_1>": 100001,
        "<extra_id_2>": 100002,
        "<extra_id_3>": 100003,
        "<extra_id_4>": 100004,
        "<extra_id_5>": 100005,
        "<extra_id_6>": 100006,
        "<extra_id_7>": 100007,
        "<extra_id_8>": 100008,
        "<extra_id_9>": 100009,
        "<extra_id_10>": 100010,
        "<extra_id_11>": 100011,
        "<extra_id_12>": 100012,
        "<extra_id_13>": 100013,
        "<extra_id_14>": 100014,
        "<extra_id_15>": 100015,
        "<extra_id_16>": 100016,
        "<extra_id_17>": 100017,
        "<extra_id_18>": 100018,
        "<extra_id_19>": 100019,
        "<extra_id_20>": 100020,
        "<extra_id_21>": 100021,
        "<extra_id_22>": 100022,
        "<extra_id_23>": 100023,
        "<extra_id_24>": 100024,
        "<extra_id_25>": 100025,
        "<extra_id_26>": 100026,
        "<extra_id_27>": 100027,
        "<extra_id_28>": 100028,
        "<extra_id_29>": 100029,
        "<extra_id_30>": 100030,
        "<extra_id_31>": 100031,
        "<extra_id_32>": 100032,
        "<extra_id_33>": 100033,
        "<extra_id_34>": 100034,
        "<extra_id_35>": 100035,
        "<extra_id_36>": 100036,
        "<extra_id_37>": 100037,
        "<extra_id_38>": 100038,
        "<extra_id_39>": 100039,
        "<extra_id_40>": 100040,
        "<extra_id_41>": 100041,
        "<extra_id_42>": 100042,
        "<extra_id_43>": 100043,
        "<extra_id_44>": 100044,
        "<extra_id_45>": 100045,
        "<extra_id_46>": 100046,
        "<extra_id_47>": 100047,
        "<extra_id_48>": 100048,
        "<extra_id_49>": 100049,
        "<extra_id_50>": 100050,
        "<extra_id_51>": 100051,
        "<extra_id_52>": 100052,
        "<extra_id_53>": 100053,
        "<extra_id_54>": 100054,
        "<extra_id_55>": 100055,
        "<extra_id_56>": 100056,
        "<extra_id_57>": 100057,
        "<extra_id_58>": 100058,
        "<extra_id_59>": 100059,
        "<extra_id_60>": 100060,
        "<extra_id_61>": 100061,
        "<extra_id_62>": 100062,
        "<extra_id_63>": 100063,
        "<extra_id_64>": 100064,
        "<extra_id_65>": 100065,
        "<extra_id_66>": 100066,
        "<extra_id_67>": 100067,
        "<extra_id_68>": 100068,
        "<extra_id_69>": 100069,
        "<extra_id_70>": 100070,
        "<extra_id_71>": 100071,
        "<extra_id_72>": 100072,
        "<extra_id_73>": 100073,
        "<extra_id_74>": 100074,
        "<extra_id_75>": 100075,
        "<extra_id_76>": 100076,
        "<extra_id_77>": 100077,
        "<extra_id_78>": 100078,
        "<extra_id_79>": 100079,
        "<extra_id_80>": 100080,
        "<extra_id_81>": 100081,
        "<extra_id_82>": 100082,
        "<extra_id_83>": 100083,
        "<extra_id_84>": 100084,
        "<extra_id_85>": 100085,
        "<extra_id_86>": 100086,
        "<extra_id_87>": 100087,
        "<extra_id_88>": 100088,
        "<extra_id_89>": 100089,
        "<extra_id_90>": 100090,
        "<extra_id_91>": 100091,
        "<extra_id_92>": 100092,
        "<extra_id_93>": 100093,
        "<extra_id_94>": 100094,
        "<extra_id_95>": 100095,
        "<extra_id_96>": 100096,
        "<extra_id_97>": 100097,
        "<extra_id_98>": 100098,
        "<extra_id_99>": 100099,
        "</s>": 100100,
        "<pad>": 100101,
        "<unk>": 100102,
      },
    );
  }

  factory CoreBPEConstructor.cl100kBase() {
    final Map<String, int> cl100kBase = cl100kBase1;
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
      mergeableRanks: cl100kBase.map(
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
    // "gpt2",
    // "r50k_base",
    // "p50k_base",
    // "p50k_edit",
    "cl100k_base",
  };
}
