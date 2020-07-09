import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  _AppControllerBase() {
    loadTheme();
  }

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
    saveThemePreferences();
  }

  void saveThemePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', isDark);
    // SharedPreferences.getInstance().then(
    //   (instance) => instance.setBool('isDark', isDark),
    // );
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('isDark') && prefs.getBool('isDark')) {
      brightness = Brightness.dark;
    } else {
      brightness = Brightness.light;
    }
  }
}
