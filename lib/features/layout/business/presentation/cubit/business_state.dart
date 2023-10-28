part of 'business_cubit.dart';

sealed class BusinessState extends Equatable {
  const BusinessState();

  @override
  List<Object> get props => [];
}

final class BusinessInitial extends BusinessState {}

final class BusinessStateIsLoading extends BusinessState {}

final class BusinessStateLoaded extends BusinessState {
  final GetBusinessData getBusinessData;
  const BusinessStateLoaded({required this.getBusinessData});
}

final class BusinessStateError extends BusinessState {
  final String msg;
 const BusinessStateError({required this.msg});
}
