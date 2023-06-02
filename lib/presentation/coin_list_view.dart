import 'package:flutter/material.dart';
import 'package:ioc_lesson/presentation/coin_list_viewmodel.dart';
import 'package:stacked/stacked.dart';

part 'widgets/coin_list_builder.dart';

class CoinListView extends StatefulWidget {
  const CoinListView({Key? key}) : super(key: key);

  @override
  State<CoinListView> createState() => _CoinListViewState();
}

class _CoinListViewState extends State<CoinListView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => CoinListViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: const [
                Expanded(
                  child: CoinListBuilder(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
