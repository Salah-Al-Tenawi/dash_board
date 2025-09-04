import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecars/core/service/locator_ser.dart';
import 'package:sharecars/features/wallet/presentation/manger/wallet_list_cubit/wallet_list_cubit.dart';
import 'package:sharecars/features/wallet/presentation/manger/wallet_transactions_cubit/wallet_transactions_cubit.dart';
import 'package:sharecars/features/wallet/presentation/view/wallet_transactions_page.dart';

class WalletListPage extends StatelessWidget {
  const WalletListPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WalletListCubit>().getAllWallets();
    return Scaffold(
      appBar: AppBar(title: const Text('Wallets')),
      body: BlocBuilder<WalletListCubit, WalletListState>(
        builder: (context, state) {
          if (state is WalletListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WalletListLoaded) {
            final wallets = state.walletList.wallets.data;

            if (wallets.isEmpty) {
              return const Center(child: Text("No wallets found"));
            }

            return ListView.builder(
              itemCount: wallets.length,
              itemBuilder: (context, index) {
                final wallet = wallets[index];

                return Card(
                  child: ListTile(
                    title: Text(
                      "${wallet.user.firstName} ${wallet.user.lastName}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Balance: ${wallet.balance}"),
                    trailing: Text(wallet.phoneNumber),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (_) => WalletTransactionsCubit(
                              getit.get(), 
                            )..getWalletTransactions(wallet.id.toString()),
                            child: WalletTransactionsPage(
                              walletId: wallet.id.toString(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is WalletListError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
