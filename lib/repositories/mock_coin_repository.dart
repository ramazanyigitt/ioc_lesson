import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:ioc_lesson/models/coin_model.dart';
import 'package:ioc_lesson/repositories/i_coin_repository.dart';

@LazySingleton(as: CoinRepository)
class MockCoinRepository implements CoinRepository {
  @override
  Future<List<CoinModel>> getCoins() async {
    final data = await rootBundle.loadString('mocks/coin_list.json');
    final json = jsonDecode(data);
    final campaigns = (json as List)
        .map(
          (campaign) => CoinModel.fromJson(campaign),
        )
        .toList();
    return campaigns;
  }
}
