import 'package:dio/dio.dart';
import 'package:pesquisa_cep/app/shared/constants/url.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pesquisa_cep/app/app_widget.dart';
import 'package:pesquisa_cep/app/modules/home/home_module.dart';
import './splash/splash_screen.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: BASE_URL))),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (context, args) => SplashScreen()),
        Router("/home", module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
