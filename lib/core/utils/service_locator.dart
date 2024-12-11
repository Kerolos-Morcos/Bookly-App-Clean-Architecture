import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_implementation.dart';
import 'package:bookly_app/features/search/domain/use_cases/search_books_result_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRemoteDataSource>(
    HomeRemoteDataSourceImplementation(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<HomeLocalDataSource>(
    HomeLocalDataSourceImplementation(),
  );

  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      homeRemoteDataSource: getIt.get<HomeRemoteDataSource>(),
      homeLocalDataSource: getIt.get<HomeLocalDataSource>(),
    ),
  );

  getIt.registerSingleton<FetchFeaturedBooksUseCase>(
    FetchFeaturedBooksUseCase(
      getIt.get<HomeRepoImplementation>(),
    ),
  );

  getIt.registerSingleton<FetchNewestBooksUseCase>(
    FetchNewestBooksUseCase(
      getIt.get<HomeRepoImplementation>(),
    ),
  );

  getIt.registerSingleton<SearchRepoImplementation>(
    SearchRepoImplementation(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerFactory<SearchBooksResultUseCase>(
    () => SearchBooksResultUseCase(
      getIt.get<SearchRepoImplementation>(),
    ),
  );

  getIt.registerFactory<SimilarBooksCubit>(
    () => SimilarBooksCubit(
      getIt.get<SearchBooksResultUseCase>(),
    ),
  );
}
