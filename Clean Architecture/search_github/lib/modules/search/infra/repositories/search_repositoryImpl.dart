import 'package:dartz/dartz.dart';

import 'package:search_github/modules/search/errors.dart';
import 'package:search_github/modules/search/domain/repositories/search_repository.dart';
import 'package:search_github/modules/search/domain/untities/result_search.dart';
import 'package:search_github/modules/search/infra/datasources/search_datasource.dart';

import 'package:search_github/modules/search/infra/models/result_search_model.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource dataSource;

  SearchRepositoryImpl(this.dataSource);

  @override
  Future<Either<DataSourceError, List<ResultSearchModel>>> search(
    String searchText,
  ) async {
    try {
      final result = await dataSource.getSearch(searchText);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(DataSourceError("Error no dada Source"));
    }
  }
}
