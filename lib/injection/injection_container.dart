import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import 'package:injectable/injectable.dart';
import 'package:ioc_lesson/repositories/i_coin_repository.dart';
import 'package:ioc_lesson/repositories/mock_coin_repository.dart';
import 'package:ioc_lesson/repositories/real_coin_repository.dart';

import '../services/coin_service.dart';
import 'injection_container.config.dart';

enum DataType {
  real,
  mock,
}

final locator = GetIt.instance;
DataType environmentTag = DataType.real;

@InjectableInit()
Future<void> configureDependencies() async {
  late final String data;
  if (kDebugMode) {
    data = const String.fromEnvironment("DATA_TYPE");
  } else {
    data = "real";
  }
  environmentTag =
      DataType.values.firstWhere((element) => element.name == data);

  locator.init(
    environment: data,
  );
}
