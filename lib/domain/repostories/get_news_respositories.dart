import 'package:dartz/dartz.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/domain/entities/get_news_data_entities.dart';

abstract class  GetNewsDataRepositories {
  Future<Either<Failure,GetNewsData>> getNewsData();
}