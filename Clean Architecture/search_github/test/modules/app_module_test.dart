import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:search_github/modules/app_module.dart';
import 'package:search_github/modules/search/domain/repositories/search_repository.dart';
import 'package:search_github/modules/search/domain/untities/result_search.dart';
import 'package:search_github/modules/search/domain/usecases/search_by_text.dart';
import 'package:search_github/modules/search/external/datasources/github_datasource.dart';
import 'package:search_github/modules/search/infra/datasources/search_datasource.dart';
import 'package:search_github/modules/search/infra/repositories/search_repositoryImpl.dart';
import 'package:search_github/modules/search/utils/github_response.dart';

import 'app_module_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final dioMock = MockDio();

  initModule(
    AppModule(),
    replaceBinds: [
      Bind.instance<Dio>(dioMock),
    ],
  );

  testWidgets('Deve recuperar o UseCase sem erro ...', (tester) async {
    final usecase = Modular.get<SearchByText>();
    expect(usecase, isA<SearchByTextImpl>());
  });

  testWidgets('Deve retorna uma lista ResultSearch do usecase...', (_) async {
    when(dioMock.get(any)).thenAnswer(
      (realInvocation) async => Response(
        requestOptions: RequestOptions(path: ''),
        data: GIT_HUB_RESULT,
        statusCode: 200,
      ),
    );

    final usecase = Modular.get<SearchByText>();

    final result = await usecase("olah");

    expect(result.isRight(), true);
  });

  testWidgets('Deve recuperar o GitHubDataSource sem erro ...', (tester) async {
    final usecase = Modular.get<SearchDataSource>();
    expect(usecase, isA<GitHubDataSource>());
  });

  testWidgets('Deve recuperar o SearchRepositoryImpl sem erro ...',
      (tester) async {
    final usecase = Modular.get<SearchRepository>();
    expect(usecase, isA<SearchRepositoryImpl>());
  });

  testWidgets('Deve recuperar o Dio sem erro...', (tester) async {
    final usecase = Modular.get<Dio>();
    expect(usecase, isA<Dio>());
  });
}
