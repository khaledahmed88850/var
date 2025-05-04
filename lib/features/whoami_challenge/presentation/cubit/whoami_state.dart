part of 'whoami_cubit.dart';

@immutable
sealed class WhoamiState {}

final class WhoamiInitial extends WhoamiState {}

final class WhoamiLoading extends WhoamiState {}

final class WhoamiSuccess extends WhoamiState {
  final WhoamiModel whoamiModel;
  WhoamiSuccess({required this.whoamiModel});
}

final class WhoamiFailure extends WhoamiState {
  final String message;
  WhoamiFailure({required this.message});
}
