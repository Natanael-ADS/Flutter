import 'package:dartz/dartz.dart';
import 'package:search_github/modules/search/infra/models/result_search_model.dart';

abstract class SearchDataSource {
  Future<List<ResultSearchModel>> getSearch(
    String texto,
  );
}
