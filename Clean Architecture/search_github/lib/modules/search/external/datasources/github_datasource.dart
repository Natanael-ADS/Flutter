import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:search_github/modules/search/errors.dart';
import 'package:search_github/modules/search/infra/datasources/search_datasource.dart';
import 'package:search_github/modules/search/infra/models/result_search_model.dart';

class GitHubDataSource implements SearchDataSource {
  static const PATH_URL = "https://api.github.com/search/users?q=";
  final Dio dio;

  GitHubDataSource(this.dio);

  @override
  Future<List<ResultSearchModel>> getSearch(String texto) async {
    final response = await dio.get(PATH_URL + _splitUrl(texto));
    if (response.statusCode == 200) {
      final jsonString = response.data;
      final objMap = json.decode(jsonString);
      final items = (objMap['items'] as List)
          .map((e) => ResultSearchModel.fromMap(e))
          .toList();
      return items;
    } else if (response.statusCode == 404) {
      return [];
    }
    throw DataSourceError("Error");
  }

  _splitUrl(String texto) {
    return texto.replaceAll(" ", "+");
  }
}
