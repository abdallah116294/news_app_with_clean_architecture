import 'package:dartz/dartz.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/core/usecases/usecase.dart';
import 'package:news/features/layout/business/domain/entities/get_business_data_entities.dart';
import 'package:news/features/layout/business/domain/repositories/business_repositories.dart';

class BusinessUseCase implements Usecases<GetBusinessData, NoParams> {
  BusinessRepository businessRepository;
  BusinessUseCase({required this.businessRepository});
  @override
  Future<Either<Failure, GetBusinessData>> call(NoParams params) =>
      businessRepository.getBusinessData();
}
