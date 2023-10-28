import 'package:dartz/dartz.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/core/usecases/usecase.dart';
import 'package:news/domain/entities/get_news_data_entities.dart';
import 'package:news/features/layout/science/domain/repository/science_repository.dart';

class ScinceUsecase implements Usecases<GetNewsData, NoParams> {
  final ScienceRepository scienceRepository;
  ScinceUsecase({required this.scienceRepository});
  @override
  Future<Either<Failure, GetNewsData>> call(NoParams params) =>
      scienceRepository.getScienceData();
}
