part of 'bank_timer_cubit.dart';

@immutable
sealed class BankTimerState {}

final class BankTimerInitial extends BankTimerState {}

final class BankTimerStarted extends BankTimerState {}

final class BankTimerStopped extends BankTimerState {}

final class BankTimerReset extends BankTimerState {}
