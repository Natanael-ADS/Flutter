import 'package:dartz/dartz.dart';
import 'package:search_github/modules/search/domain/repositories/search_repository.dart';
import 'package:search_github/modules/search/domain/untities/result_search.dart';
import '../../errors.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(
      String searchText) async {
    return repository.search(searchText);
  }
}
