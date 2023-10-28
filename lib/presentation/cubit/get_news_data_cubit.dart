import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/core/usecases/usecase.dart';

import '../../domain/entities/get_news_data_entities.dart';
import '../../domain/usecases/get_news_usecase.dart';

part 'get_news_data_state.dart';

class GetNewsDataCubit extends Cubit<GetNewsDataState> {
  GetNewsDataCubit({required this.getNewsDataUsecase})
      : super(GetNewsDataInitial());
  static GetNewsDataCubit get(context) => BlocProvider.of(context);
  final GetNewsDataUsecase getNewsDataUsecase;
  List articles = [];
  Future<void> getNewsData() async {
    Either<Failure, GetNewsData> response =
        await getNewsDataUsecase(NoParams());
    debugPrint(response.toString());
    articles.add(response);
    emit(response
        .fold((failure) => GetNewsDataError(msg: _mapFailureToMsg(failure)),
            (newsdata) {
      return GetNewsDataLoaded(getNewsData: newsdata);
    }));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "ServerFailure";
      case CacheFailure:
        return "CacheFailure";

      default:
        return "unexpectedError";
    }
  }
}
