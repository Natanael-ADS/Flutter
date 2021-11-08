import 'dart:convert';
import 'package:search_github/modules/search/domain/untities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String mContent;
  final String mImg;
  final String mTitle;

  ResultSearchModel({
    required this.mContent,
    required this.mImg,
    required this.mTitle,
  }) : super(content: mContent, img: mImg, title: mTitle);

  Map<String, dynamic> toMap() {
    return {
      'mContent': mContent,
      'mImg': mImg,
      'mTitle': mTitle,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      mContent: map['mContent'],
      mImg: map['mImg'],
      mTitle: map['mTitle'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(
        json.decode(source),
      );
}
