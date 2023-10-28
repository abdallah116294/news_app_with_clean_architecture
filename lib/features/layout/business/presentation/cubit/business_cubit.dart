import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/usecases/usecase.dart';
import '../../../../../core/error/failures.dart';
import '../../domain/entities/get_business_data_entities.dart';
import '../../domain/usecases/business_usecase.dart';
part 'business_state.dart';

class BusinessCubit extends Cubit<BusinessState> {
  BusinessCubit({required this.businessUseCase}) : super(BusinessInitial());
  static BusinessCubit get(context) => BlocProvider.of(context);
  final BusinessUseCase businessUseCase;
  Future<void> getBusinessData() async {
    Either<Failure, GetBusinessData> response =
        await businessUseCase(NoParams());
    emit(response.fold((failur) => BusinessStateError(msg: _mapFailureToMsg(failur)), (businessdata) =>BusinessStateLoaded(getBusinessData: businessdata) ));
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
