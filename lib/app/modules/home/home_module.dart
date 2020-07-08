import 'package:pesquisa_cep/app/modules/home/repository/cep_repository.dart';
import 'package:pesquisa_cep/app/shared/constants/url.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController((i.get<CepRepository>()))),
        Bind((i) => CepRepository(i.get<Dio>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
