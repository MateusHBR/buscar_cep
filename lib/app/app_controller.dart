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
  ThemeData themeData;

  @computed
  bool get isDark => themeData.brightness == Brightness.dark;

  @action
  void changeTheme() {
    if (isDark) {
      themeData = ThemeData.light();
    } else {
      themeData = ThemeData.dark();
    }
    saveThemePreferences();
  }

  void saveThemePreferences() {
    SharedPreferences.getInstance().then(
      (instance) => instance.setBool('isDark', isDark),
    );
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('isDark') && prefs.getBool('isDark')) {
      themeData = ThemeData.dark();
    } else {
      themeData = ThemeData.light();
    }
  }
}
