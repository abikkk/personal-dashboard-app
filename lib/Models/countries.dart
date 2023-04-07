// class Country {
//   final String name;
//   final String code;
//   final List suffix;
//
//   // final List currency;
//   // final String symbol;
//
//   const Country({
//     required  required this.name,
//     required  required this.code,
//     required  required this.suffix,
//     // required  required this.currency,
//     // required  required this.symbol
//   });
//
//   factory Country.fromJson(Map<String, dynamic> json) {
//     return Country(
//       name: json['name']['common'],
//       code: json['idd']['root'],
//       suffix: json['idd']['suffixes'],
//       // currency: json['currencies'],
//       // symbol: json['currencies']['symbol']
//     );
//   }
// }

// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);
// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';


Country countryFromJson(String str) => Country.fromJson(json.decode(str));

String countryToJson(Country data) => json.encode(data.toJson());

class Country {
  Country({
    this.name,
    this.callingCodes,
    this.capital,
    // this.altSpellings,
    this.subregion,
    this.region,
    this.population,
    this.latlng,
    this.demonym,
    this.area,
    this.timezones,
    this.nativeName,
    this.numericCode,
    this.flags,
    this.currencies,
  });

  String? name;
  List<String?>? callingCodes;
  String? capital;
  String? subregion;
  String? region;
  int? population;
  List<double>? latlng;
  String? demonym;
  double? area;
  List<String?>? timezones;
  String? nativeName;
  String? numericCode;
  Flags? flags;
  List<Currency?>? currencies;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        callingCodes: List<String>.from(json["callingCodes"].map((x) => x)),
        capital: json["capital"],
        // altSpellings: List<String>.from(json["altSpellings"]?.map((x) => x)),
        subregion: json["subregion"],
        region: json["region"],
        population: json["population"],
        latlng: json['latlng'] != null
            ? List<double>.from(json["latlng"].map((x) => x))
            : null,
        demonym: json["demonym"],
        area: json["area"] ?? null,
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        nativeName: json["nativeName"],
        numericCode: json["numericCode"],
        flags: Flags.fromJson(json["flags"]),
        currencies: json['currencies'] != null
            ? List<Currency?>.from(
                json["currencies"].map((x) => Currency.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        // "callingCodes": List<dynamic>.from(callingCodes.map((x) => x)),
        "capital": capital,
        // "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
        "subregion": subregion,
        "region": region,
        "population": population,
        // "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "demonym": demonym,
        "area": area,
        // "timezones": List<dynamic>.from(timezones.map((x) => x)),
        "nativeName": nativeName,
        "numericCode": numericCode,
        // "flags": flags.toJson(),?
        // "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
      };
}

class Currency {
  Currency({
    this.code,
    this.name,
    this.symbol,
  });

  String? code;
  String? name;
  String? symbol;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "symbol": symbol,
      };
}

class Flags {
  Flags({
    required this.svg,
    required this.png,
  });

  String svg;
  String png;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        svg: json["svg"],
        png: json["png"],
      );

  Map<String, dynamic> toJson() => {
        "svg": svg,
        "png": png,
      };
}
