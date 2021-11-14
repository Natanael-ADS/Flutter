import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_github/modules/search/errors.dart';
import 'package:search_github/modules/search/infra/datasources/search_datasource.dart';
import 'package:search_github/modules/search/infra/models/result_search_model.dart';
import 'package:search_github/modules/search/infra/repositories/search_repositoryImpl.dart';

class SearchDataSourceMock implements SearchDataSource {
  @override
  Future<List<ResultSearchModel>> getSearch(String texto) async {
    final ResultSearchModel model = ResultSearchModel(
      content: "",
      img: "",
      title: "",
    );

    List<ResultSearchModel> models = [model];
    if (texto == "oi") {
      return models;
    } else if (texto.isEmpty) {
      return [];
    }

    int.parse(texto);
    return [];
  }
}

void main() {
  final dataSource = SearchDataSourceMock();
  final repositoryImpl = SearchRepositoryImpl(dataSource);
  testWidgets('Deve retorna uma Lista ResultSearch ...', (tester) async {
    final result = await repositoryImpl.search("oi");
    List<ResultSearchModel> models = [];

    result.all((r) {
      models = r;
      return true;
    });
    expect(models.isNotEmpty, true);
  });

  testWidgets('Deve retorna uma Lista Vazia ...', (tester) async {
    final result = await repositoryImpl.search("");
    List<ResultSearchModel> models = [];
    models = result.getOrElse(() => []);
    expect(models.isEmpty, true);
  });

  test('Deve retornar um erro', () async {
    final result = await repositoryImpl.search("_");
    expect(result.isLeft(), true);
  });
}
