import 'package:ioc_lesson/models/coin_model.dart';

import '../injection/injection_container.dart';
import '../repositories/i_coin_repository.dart';

class CoinService {
  CoinRepository coinRepository = locator<CoinRepository>();

  Future<List<CoinModel>> getCoins() async {
    return coinRepository.getCoins();
  }
}
