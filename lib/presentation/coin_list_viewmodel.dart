import 'package:ioc_lesson/models/coin_model.dart';
import 'package:ioc_lesson/repositories/i_coin_repository.dart';
import 'package:ioc_lesson/services/coin_service.dart';
import 'package:stacked/stacked.dart';

import '../injection/injection_container.dart';

class CoinListViewModel extends BaseViewModel {
  CoinRepository coinRepository = locator<CoinRepository>();

  late bool isInitialised;

  List<CoinModel> coins = [];

  Future<void> init() async {
    isInitialised = false;
    await getCoins();
    isInitialised = true;
    notifyListeners();
  }

  Future<void> getCoins() async {
    coins = await coinRepository.getCoins();
  }
}
