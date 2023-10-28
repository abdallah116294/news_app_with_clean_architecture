part of 'get_news_data_cubit.dart';

sealed class GetNewsDataState extends Equatable {
  const GetNewsDataState();

  @override
  List<Object> get props => [];
}

final class GetNewsDataInitial extends GetNewsDataState {}

class GetNewsDataIsLoadingState extends GetNewsDataState {}

class GetNewsDataLoaded extends GetNewsDataState {
  final GetNewsData getNewsData;
  const GetNewsDataLoaded({required this.getNewsData});
}

class GetNewsDataError extends GetNewsDataState {
  final String msg;
const   GetNewsDataError({required this.msg});

}
