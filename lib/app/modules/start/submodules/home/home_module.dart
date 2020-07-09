import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pesquisa_cep/app/app_controller.dart';
import 'package:pesquisa_cep/app/shared/stores/favorite_store.dart';

import './repository/cep_repository.dart';
import './home_controller.dart';
import './home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => HomeController(
            (i.get<CepRepository>()),
            (i.get<AppController>()),
            (i.get<FavoriteStore>()),
          ),
        ),
        Bind((i) => CepRepository(i.get<Dio>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
