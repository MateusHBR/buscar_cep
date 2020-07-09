import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import './app_controller.dart';
import './app_widget.dart';
import './modules/start/start_module.dart';

import './splash/splash_screen.dart';
import './shared/repositories/local_storage/local_storage_shared.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController(i.get<LocalStorageShared>())),
        Bind((i) => LocalStorageShared()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (context, args) => SplashScreen()),
        Router("/start", module: StartModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
