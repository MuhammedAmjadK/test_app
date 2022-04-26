import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/Model/court_model.dart';

ValueNotifier<List<CourtModel>> courtModelListNotifier = ValueNotifier([]);
ValueNotifier<CourtModel> courtDetailNotifier =
    ValueNotifier(CourtModel(title: '...', description: '...'));

class CourtRepository extends ChangeNotifier {
  Future<List<CourtModel>> fetchList() async {
    courtModelListNotifier.value.clear();

    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var item in data) {
        CourtModel _courtModel = CourtModel.fromJson(item);
        courtModelListNotifier.value.add(_courtModel);
      }
      courtModelListNotifier.notifyListeners();
      return courtModelListNotifier.value;
    } else {
      return courtModelListNotifier.value; // empty list
    }
  }

  Future<CourtModel> fetchDetails() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var item in data) {
        courtDetailNotifier.value = CourtModel.fromJson(item);
      }

      courtDetailNotifier.notifyListeners();
    }
    return courtDetailNotifier.value;
  }
}
