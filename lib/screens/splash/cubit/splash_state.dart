
part of 'splash_cubit.dart';

class SplashState extends Equatable{
  final int value;

  const SplashState({this.value = 0});

  @override
  // TODO: implement props
  List<Object?> get props => [value];

  SplashState copyWith({int? value}){
    return SplashState(
      value: value??this.value,
    );
  }
}