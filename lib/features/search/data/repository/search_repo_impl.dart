import 'package:dartz/dartz.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/domain/entities/get_news_data_entities.dart';
import 'package:news/features/search/data/datasource/search_remote_data_source.dart';
import 'package:news/features/search/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRemoteDataSource searchRemoteDataSource;
  SearchRepositoryImpl({required this.searchRemoteDataSource});
  @override
  Future<Either<Failure, GetNewsData>> getSearch(String item) async {
    try {
      var searchItm = await searchRemoteDataSource.searchData(item);
      return Right(searchItm);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
