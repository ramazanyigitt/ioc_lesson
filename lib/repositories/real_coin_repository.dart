import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:ioc_lesson/models/coin_model.dart';
import 'package:ioc_lesson/repositories/i_coin_repository.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: CoinRepository)
class RealCoinRepository implements CoinRepository {
  @override
  Future<List<CoinModel>> getCoins() async {
    http.Response response = await http.get(
      Uri.parse('https://api.coingecko.com/api/v3/coins/list'),
    );
    final coinList = json.decode(response.body);
    return (coinList as List).map((e) => CoinModel.fromJson(e)).toList();
  }
}
