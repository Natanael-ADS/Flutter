import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search_github/modules/search/errors.dart';
import 'package:search_github/modules/search/external/datasources/github_datasource.dart';
import 'package:search_github/modules/search/infra/models/result_search_model.dart';
import 'package:search_github/modules/search/utils/github_response.dart';

import 'github_datasource_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final dio = MockDio();
  final datasource = GitHubDataSource(dio);

  testWidgets('Deve retorna uma lista ResultSearchModel...', (_) async {
    when(dio.get(any)).thenAnswer((realInvocation) async {
      return Response(
        requestOptions: RequestOptions(path: ''),
        data: GIT_HUB_RESULT,
        statusCode: 200,
      );
    });

    final result = await datasource.getSearch("oi");

    expect(result, isNotEmpty);
  });

  testWidgets('Deve retorna uma lista vazia...', (_) async {
    when(dio.get(any)).thenAnswer((realInvocation) async {
      return Response(
        requestOptions: RequestOptions(path: ''),
        data: '',
        statusCode: 404,
      );
    });

    final result = await datasource.getSearch("oi");

    expect(result, isEmpty);
  });

  testWidgets('Deve retorna um error', (_) async {
    when(dio.get(any)).thenAnswer((_) async {
      return Response(
        requestOptions: RequestOptions(path: ""),
        data: null,
        statusCode: 500,
      );
    });

    final result = datasource.getSearch("");

    expect(result, throwsA(isA<DataSourceError>()));
  });
}
