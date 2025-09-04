import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecars/features/wallet/presentation/manger/wallet_charge_cubit/wallet_charge_cubit.dart';
class WalletChargePage extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  WalletChargePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Charge Wallet')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final amount = amountController.text;
                final phone = phoneController.text;
                context.read<WalletChargeCubit>().chargeWallet(amount, phone);
              },
              child: const Text('Charge'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<WalletChargeCubit, WalletChargeState>(
              builder: (context, state) {
                if (state is WalletChargeLoading) {
                  return const CircularProgressIndicator();
                } else if (state is WalletChargeLoaded) {
                  return Text('Success: ${state.walletChargeResponse.transactionId}');
                } else if (state is WalletChargeError) {
                  return Text('Error: ${state.message}');
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
