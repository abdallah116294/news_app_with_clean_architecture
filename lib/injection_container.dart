import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news/data/repositories/repostiory.dart';
import 'package:news/features/layout/business/data/datasource/remote_data_source.dart';
import 'package:news/features/layout/business/data/repositories/business_repository_impl.dart';
import 'package:news/features/layout/business/domain/repositories/business_repositories.dart';
import 'package:news/features/layout/business/domain/usecases/business_usecase.dart';
import 'package:news/features/layout/business/presentation/cubit/business_cubit.dart';
import 'package:news/features/layout/science/data/datasource/remote_data_source.dart';
import 'package:news/features/layout/science/data/repository/science_repository_impl.dart';
import 'package:news/features/layout/science/domain/repository/science_repository.dart';
import 'package:news/features/layout/science/domain/usecase/science_usecase.dart';
import 'package:news/features/layout/science/presentation/cubit/science_cubit.dart';
import 'package:news/features/search/data/datasource/search_remote_data_source.dart';
import 'package:news/features/search/data/repository/search_repo_impl.dart';
import 'package:news/features/search/domain/repository/search_repository.dart';
import 'package:news/features/search/domain/usecase/search_usecase.dart';
import 'package:news/features/search/presentation/cubit/search_cubit.dart';
import 'package:news/presentation/cubit/get_news_data_cubit.dart';
import 'core/api/dio_helper.dart';
import 'data/datasource/remote_data_source.dart';
import 'domain/repostories/get_news_respositories.dart';
import 'domain/usecases/get_news_usecase.dart';

final sl = GetIt.instance;
Future<void> init() async {
//!Features
//!Business
//Bloc
  sl.registerFactory(() => BusinessCubit(businessUseCase: sl()));
//use case
  sl.registerLazySingleton<BusinessUseCase>(
      () => BusinessUseCase(businessRepository: sl()));
//repositories
  sl.registerLazySingleton<BusinessRepository>(
      () => BusinessRepositoriesImpl(getBusinessRemoteDataSource: sl()));
// data source
  sl.registerLazySingleton<GetBusinessRemoteDataSource>(
      () => GetBusinessRemoteDataSourceImpl(dioHepler: sl()));
//! Science
//bloc
  sl.registerFactory(() => ScienceCubit(scinceUsecase: sl()));
//usec case
  sl.registerLazySingleton(() => ScinceUsecase(scienceRepository: sl()));
// repository
  sl.registerLazySingleton<ScienceRepository>(
      () => ScienceRepositoryImpl(scienceRemoteDataSource: sl()));
// data source
  sl.registerLazySingleton<ScienceRemoteDataSource>(
      () => ScienceRemoteDataSourceImpl(dioHepler: sl()));

//!Sports
// Bloc
  sl.registerFactory(() => GetNewsDataCubit(getNewsDataUsecase: sl()));
// use case
  sl.registerLazySingleton<GetNewsDataUsecase>(
      () => GetNewsDataUsecase(getNewsDataRepositories: sl()));
  //repositories
  sl.registerLazySingleton<GetNewsDataRepositories>(
      () => GetNewsDataRepositoriesImpl(remoteDataSource: sl()));
  //data source
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(dioHeler: sl()));
  //!search
  //Bloc
  sl.registerFactory(() => SearchCubit(searchUseCase: sl()));
  //use case
  sl.registerLazySingleton(() => SearchUseCase(searchRepository: sl()));
  //repository
  sl.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(searchRemoteDataSource: sl()));
  //data source
  sl.registerLazySingleton<SearchRemoteDataSource>(() =>SearchRemoteDataSourceImpl(dioHepler: sl()));
  //dio helper
  sl.registerLazySingleton(() => DioHepler(sl()));
  sl.registerLazySingleton(() => Dio());
}
