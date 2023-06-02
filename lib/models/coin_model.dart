import 'dart:convert';

class CoinModel {
  final String? id;
  final String? symbol;
  final String? name;

  CoinModel({
    this.id,
    this.symbol,
    this.name,
  });

  CoinModel copyWith({
    String? id,
    String? symbol,
    String? name,
  }) =>
      CoinModel(
        id: id ?? this.id,
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
      );

  factory CoinModel.fromRawJson(String str) =>
      CoinModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
      };
}
