import 'package:ioc_lesson/models/coin_model.dart';

abstract class CoinRepository {
  Future<List<CoinModel>> getCoins();
}
