import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pesquisa_cep/app/shared/models/cep_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageShared {
  Completer<SharedPreferences> _instance = Completer<SharedPreferences>();

  _init() async {
    _instance.complete(await SharedPreferences.getInstance());
  }

  LocalStorageShared() {
    _init();
  }

  Future<bool> getTheme(String key) async {
    var shared = await _instance.future;
    return shared.getBool(key);
  }

  Future putTheme(String key, bool value) async {
    var shared = await _instance.future;
    shared.setBool(key, value);
  }

  Future loadTheme() async {
    var shared = await _instance.future;
    if (shared.containsKey('isDark') && shared.getBool('isDark')) {
      return Brightness.dark;
    } else {
      return Brightness.light;
    }
  }

  Future putList(List<CepModel> listCeps) async {
    var shared = await _instance.future;
    final String encodedData = CepModel.encodeCeps(listCeps);
    shared.setString('list', encodedData);
  }

  Future<List<CepModel>> getList() async {
    var shared = await _instance.future;
    var decodedData = CepModel.decodeCeps(shared.getString('list'));
    return decodedData;
  }

  Future delete(String key) async {
    var shared = await _instance.future;
    shared.remove(key);
  }
}
