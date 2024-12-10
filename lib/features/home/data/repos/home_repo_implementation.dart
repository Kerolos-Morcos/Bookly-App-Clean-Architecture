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
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var booksLocalList = homeLocalDataSource.fetchFeaturedBooks();
      if (booksLocalList.isNotEmpty) {
        return Right(booksLocalList);
      }
      var booksRemoteList = await homeRemoteDataSource.fetchFeaturedBooks();
      return Right(booksRemoteList);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var boxLocalList = homeLocalDataSource.fetchNewestBooks();
      if (boxLocalList.isNotEmpty) {
        return Right(boxLocalList);
      }
      var boxRemoteList = await homeRemoteDataSource.fetchNewestBooks();
      return Right(boxRemoteList);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
