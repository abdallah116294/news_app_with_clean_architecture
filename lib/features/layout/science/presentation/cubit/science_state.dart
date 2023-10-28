part of 'science_cubit.dart';

sealed class ScienceState extends Equatable {
  const ScienceState();

  @override
  List<Object> get props => [];
}

final class ScienceInitial extends ScienceState {}

final class ScienceStateIsLoading extends ScienceState {}

final class ScienceStateLoaded extends ScienceState {
  final GetNewsData getNewsData;
  const ScienceStateLoaded({required this.getNewsData});
}

final class ScienceStateError extends ScienceState {
  final String msg;
 const  ScienceStateError({required this.msg});
}
