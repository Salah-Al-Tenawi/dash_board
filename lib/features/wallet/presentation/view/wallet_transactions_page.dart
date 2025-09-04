import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecars/features/wallet/presentation/manger/wallet_transactions_cubit/wallet_transactions_cubit.dart';

class WalletTransactionsPage extends StatelessWidget {
  final String walletId;
  const WalletTransactionsPage({super.key, required this.walletId});

  @override
  Widget build(BuildContext context) {
    // استدعاء جلب الحركات
    context.read<WalletTransactionsCubit>().getWalletTransactions(walletId);

    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: BlocBuilder<WalletTransactionsCubit, WalletState>(
        builder: (context, state) {
          if (state is WalletLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WalletTransactionsLoaded) {
            // نجيب قائمة الحركات
            final transactions = state.walletTransactions.transactions.data;

            if (transactions.isEmpty) {
              return const Center(child: Text("No transactions found"));
            }

            return ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final tx = transactions[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      tx.description,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Amount: ${tx.amount}"),
                        Text("Type: ${tx.type}"),
                        Text("Status: ${tx.status}"),
                      ],
                    ),
                    trailing: Text(
                      tx.createdAt.toLocal().toString().split(' ')[0],
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                );
              },
            );
          } else if (state is WalletError) {
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
