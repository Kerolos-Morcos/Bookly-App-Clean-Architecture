import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplementation extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImplementation({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    return _fetchBooks(
      localFetch: homeLocalDataSource.fetchFeaturedBooks,
      remoteFetch: homeRemoteDataSource.fetchFeaturedBooks,
    );
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() {
    return _fetchBooks(
      localFetch: homeLocalDataSource.fetchNewestBooks,
      remoteFetch: homeRemoteDataSource.fetchNewestBooks,
    );
  }

  Future<Either<Failure, List<BookEntity>>> _fetchBooks({
    required List<BookEntity> Function() localFetch,
    required Future<List<BookEntity>> Function() remoteFetch,
  }) async {
    try {
      List<BookEntity> books = localFetch();
      if (books.isNotEmpty) {
        return Right(books);
      }
      books = await remoteFetch();
      return Right(books);
    } catch (e) {
      return Left(
        ServerFailure(errorMessage: e.toString()),
      );
    }
  }
}
