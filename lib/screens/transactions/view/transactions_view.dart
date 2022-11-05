import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/transactions/cubit/expenses_transaction_cubit.dart';
import 'package:your_money/screens/transactions/cubit/income_transaction__cubit.dart';
import 'package:your_money/screens/transactions/cubit/transactions_cubit.dart';
import 'package:your_money/screens/transactions/view/transactions_page.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => TransactionsCubit()),
        BlocProvider(create: (BuildContext context) => ExpensesTransactionCubit()..loadingExpensesTransaction()),
      ],
      child: const TransactionsPage(),
    );
  }
}
