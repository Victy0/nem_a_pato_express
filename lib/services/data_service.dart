import 'package:flutter/services.dart' as root_bundle;
import 'dart:convert';

import 'package:nem_a_pato_app/models/question.dart';
import 'package:nem_a_pato_app/models/theme.dart';

class DataService {
  Map<String, dynamic> dataLoaded = {};

  Future<Map<String, dynamic>> loadData() async {
    if (dataLoaded.isNotEmpty) {
      return dataLoaded;
    }
    try {
      String content = await root_bundle.rootBundle.loadString('assets/data/data.json');
      dataLoaded = jsonDecode(content);
      return dataLoaded;
    } catch (e) {
      return {};
    }
  }

  Future<int> loadThemeQuantity() async {
    Map<String, dynamic>? dataLoaded = await loadData();

    if (dataLoaded.containsKey('themeQuantity')) {
      var themeNumber = dataLoaded['themeQuantity'] as int;
      return themeNumber;
    } else {
      return 0;
    }
  }

  Future<List<Question>> loadQuestionsByThemeIndex(int themeIndex) async {
    Map<String, dynamic> datas = await loadData();

    if (datas.containsKey('themeList')) {
      var listaTemas = datas['themeList'] as List;
      var tema = listaTemas.firstWhere(
        (item) => item['themeNumber'] == themeIndex,
        orElse: () => null,
      );

      if (tema != null) {
        Theme theme = Theme.fromJson(tema);
        return theme.questions;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<Question> loadQuestionByThemeAndQuestionIndex(int themeIndex, int questionIndex) async {
    Map<String, dynamic> dataLoaded = await loadData();

    if (dataLoaded.containsKey('themeList')) {
      var themeListLoaded = dataLoaded['themeList'] as List;

      var themeJson = themeListLoaded[themeIndex];
      Theme theme = Theme.fromJson(themeJson);
      Question question = theme.questions[questionIndex];
      question.setTheme(theme.theme);
      return question;
    } else {
      return Question(question: "ERROR", answer: 0);
    }
  }
}