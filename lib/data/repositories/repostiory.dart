import 'package:dartz/dartz.dart';

import 'package:news/core/error/failures.dart';
import 'package:news/data/datasource/remote_data_source.dart';

import 'package:news/domain/entities/get_news_data_entities.dart';

import '../../domain/repostories/get_news_respositories.dart';

class GetNewsDataRepositoriesImpl implements GetNewsDataRepositories {
  final RemoteDataSource remoteDataSource;
  GetNewsDataRepositoriesImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, GetNewsData>> getNewsData() async {
    try {
      final newsdata = await remoteDataSource.getNewsDataModel();
      return Right(newsdata);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
