// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  Computed<bool> _$isDarkComputed;

  @override
  bool get isDark => (_$isDarkComputed ??=
          Computed<bool>(() => super.isDark, name: '_AppControllerBase.isDark'))
      .value;

  final _$themeDataAtom = Atom(name: '_AppControllerBase.themeData');

  @override
  ThemeData get themeData {
    _$themeDataAtom.reportRead();
    return super.themeData;
  }

  @override
  set themeData(ThemeData value) {
    _$themeDataAtom.reportWrite(value, super.themeData, () {
      super.themeData = value;
    });
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  void changeTheme() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeData: ${themeData},
isDark: ${isDark}
    ''';
  }
}
