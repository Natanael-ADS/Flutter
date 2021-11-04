import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_github/modules/search/domain/errors.dart';
import 'package:search_github/modules/search/domain/repositories/search_repository.dart';
import 'package:search_github/modules/search/domain/untities/result_search.dart';
import 'package:search_github/modules/search/domain/usecases/search_by_text.dart';

class SearchRepositoryMock implements SearchRepository {
  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
      String searchText) async {
    List<ResultSearch> lista = [
      ResultSearch(title: "oi", content: "oba", img: "bb")
    ];

    if (searchText == "error") {
      return left(FailureSearch());
    } else if (searchText == "tem") {
      return right(lista);
    } else if (searchText.isEmpty) {
      lista = [];
      return right(lista);
    }
    return right(lista);
  }
}

void main() {
  final repository = SearchRepositoryMock();
  final usecases = SearchByTextImpl(repository);
  test('Deve retorna uma lista de resultSearch...', () async {
    final result = await usecases("natanael");
    expect(result, isA<Right>());
  });

  test('Deve dá lista vazia...', () async {
    final result = await usecases("");
    expect(result, isA<Right>());
  });

  test('Deve dá erro ...', () async {
    final result = await usecases("error");
    expect(result, isA<Left>());
  });
}
