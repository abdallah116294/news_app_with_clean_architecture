import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/core/usecases/usecase.dart';
import 'package:news/features/layout/science/domain/usecase/science_usecase.dart';

import '../../../../../domain/entities/get_news_data_entities.dart';

part 'science_state.dart';

class ScienceCubit extends Cubit<ScienceState> {
  ScienceCubit({required this.scinceUsecase}) : super(ScienceInitial());
  static ScienceCubit get(context) => BlocProvider.of(context);
  final ScinceUsecase scinceUsecase;
  Future<void> getScienceData() async {
    Either<Failure, GetNewsData> response = await scinceUsecase(NoParams());
    emit(response.fold(
        (failure) => ScienceStateError(msg: _mapFailureToMsg(failure)), (sciencedata) => ScienceStateLoaded(getNewsData: sciencedata)));
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
