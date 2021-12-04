import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_github/modules/search/external/datasources/github_datasource.dart';

import 'search/domain/usecases/search_by_text.dart';
import 'search/infra/repositories/search_repositoryImpl.dart';

class AppModule extends Module {
  @override
  List<Bind> binds = [
    Bind.factory<Dio>((i) => Dio()),
    Bind.factory<GitHubDataSource>((i) => GitHubDataSource(i())),
    Bind.factory<SearchRepositoryImpl>((i) => SearchRepositoryImpl(i())),
    Bind.factory<SearchByTextImpl>((i) => SearchByTextImpl(i())),
  ];

  @override
  List<ModularRoute> routes = [];
}
