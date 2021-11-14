import 'dart:convert';
import 'package:search_github/modules/search/domain/untities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String content;
  final String img;
  final String title;

  ResultSearchModel({
    required this.content,
    required this.img,
    required this.title,
  }) : super(content: content, img: img, title: title);

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'img': img,
      'title': title,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      content: map['html_url'],
      img: map['avatar_url'],
      title: map['login'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(
        json.decode(source),
      );
}
