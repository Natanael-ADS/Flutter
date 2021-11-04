import 'package:dartz/dartz.dart';
import 'package:search_github/modules/search/domain/untities/result_search.dart';

import '../errors.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText);
}
