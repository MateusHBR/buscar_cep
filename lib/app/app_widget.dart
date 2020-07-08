import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pesquisa_cep/app/app_controller.dart';

class AppWidget extends StatelessWidget {
  final controller = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.themeData != null) {
          return MaterialApp(
            navigatorKey: Modular.navigatorKey,
            title: 'Flutter Slidy',
            debugShowCheckedModeBanner: false,
            theme: controller.themeData,
            initialRoute: '/',
            onGenerateRoute: Modular.generateRoute,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
