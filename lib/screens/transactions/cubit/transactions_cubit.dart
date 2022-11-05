import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState>{

  TransactionsCubit(): super( const TransactionsState());

}