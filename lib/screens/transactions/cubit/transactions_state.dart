
part of 'transactions_cubit.dart';

class TransactionsState extends Equatable{
  final int value;

  const TransactionsState({this.value = 0});

  @override
  // TODO: implement props
  List<Object?> get props => [value];

  TransactionsState copyWith({int? value}){
    return TransactionsState(
      value: value??this.value,
    );
  }
}