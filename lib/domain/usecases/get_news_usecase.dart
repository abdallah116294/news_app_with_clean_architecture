import 'package:dartz/dartz.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/core/usecases/usecase.dart';
import 'package:news/domain/entities/get_news_data_entities.dart';
import 'package:news/domain/repostories/get_news_respositories.dart';

class GetNewsDataUsecase implements Usecases<GetNewsData, NoParams> {
  final GetNewsDataRepositories getNewsDataRepositories;
  GetNewsDataUsecase({required this.getNewsDataRepositories});
  @override
  Future<Either<Failure, GetNewsData>> call(NoParams params) =>
      getNewsDataRepositories.getNewsData();
}
