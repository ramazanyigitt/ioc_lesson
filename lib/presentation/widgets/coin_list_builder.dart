part of '../coin_list_view.dart';

class CoinListBuilder extends ViewModelWidget<CoinListViewModel> {
  const CoinListBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CoinListViewModel viewModel) {
    return !viewModel.isInitialised
        ? const Center(child: CircularProgressIndicator())
        : viewModel.coins.isEmpty
            ? const Text('There is nothing to show')
            : ListView.builder(
                itemBuilder: (context, index) {
                  final coin = viewModel.coins[index];
                  return ListTile(
                    title: Text(coin.name ?? ''),
                    subtitle: Text(coin.symbol ?? ''),
                  );
                },
                itemCount: viewModel.coins.length,
              );
  }
}
