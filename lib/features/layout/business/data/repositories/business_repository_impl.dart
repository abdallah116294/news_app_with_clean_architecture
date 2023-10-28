import 'package:dartz/dartz.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/features/layout/business/domain/entities/get_business_data_entities.dart';
import 'package:news/features/layout/business/domain/repositories/business_repositories.dart';

import '../datasource/remote_data_source.dart';

class BusinessRepositoriesImpl implements BusinessRepository {
  final GetBusinessRemoteDataSource getBusinessRemoteDataSource;
  BusinessRepositoriesImpl({required this.getBusinessRemoteDataSource});
  @override
  Future<Either<Failure, GetBusinessData>> getBusinessData() async {
    try {
      final bussinessdata = await getBusinessRemoteDataSource.getBusinessData();
      return Right(bussinessdata);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
