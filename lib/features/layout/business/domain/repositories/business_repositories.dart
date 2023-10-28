import 'package:dartz/dartz.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/features/layout/business/domain/entities/get_business_data_entities.dart';

abstract class BusinessRepository {
  Future<Either<Failure, GetBusinessData>> getBusinessData();
}
