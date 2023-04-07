import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/countries.dart';
import 'constants.dart';

class NetworkCalls {
  static Future<dynamic> getCountriesList() async {
    var url = 'https://restcountries.com/v2/all';
    debugPrint('>> getCountriesList URL: $url');
    var countries;
    await http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        var temp = jsonDecode(response.body) as List;
        countries = temp.map<Country>((e) => Country.fromJson(e)).toList();
        debugPrint('>> country list : ${countries.length.toString()}');
        return countries;
      } else {
        debugPrint(
            '${ConstantResponses.apiResError} getCountriesList. (${response.statusCode.toString()})');
        countries =
            '${ConstantResponses.apiResError} getCountriesList. (${response.statusCode.toString()})';
      }
    }).catchError((error) {
      debugPrint(
          '${ConstantResponses.apiCallError} getCountriesList: ${error.toString()}');
      countries =
          '${ConstantResponses.apiCallError} getCountriesList. ${error.toString()}';
    });
    return countries;
  }

  static getCountryCode(String country) {}
}
