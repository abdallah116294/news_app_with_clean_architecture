import 'package:dartz/dartz.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/domain/entities/get_news_data_entities.dart';
import 'package:news/features/layout/science/data/datasource/remote_data_source.dart';
import 'package:news/features/layout/science/domain/repository/science_repository.dart';

class ScienceRepositoryImpl implements ScienceRepository {
  final ScienceRemoteDataSource scienceRemoteDataSource;
  ScienceRepositoryImpl({required this.scienceRemoteDataSource});
  @override
  Future<Either<Failure, GetNewsData>> getScienceData() async {
    try {
      final sciencedata = await scienceRemoteDataSource.getScienceData();
      return Right(sciencedata);
    } catch (error) {
      return left(ServerFailure());
    }
  }
}
