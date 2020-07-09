import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import './shared/repositories/local_storage/local_storage_shared.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  _AppControllerBase(this._shared) {
    loadTheme();
  }

  final LocalStorageShared _shared;

  @observable
  Brightness brightness;

  @computed
  bool get isDark => brightness == Brightness.dark;

  @action
  void changeTheme() {
    if (isDark) {
      brightness = Brightness.light;
    } else {
      brightness = Brightness.dark;
    }
    _shared.putTheme('isDark', isDark);
  }

  void loadTheme() async {
    brightness = await _shared.loadTheme();
  }
}
