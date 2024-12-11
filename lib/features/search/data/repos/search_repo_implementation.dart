import 'dart:developer';

import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiService apiService;
  SearchRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchBooksResult({
    required String bookName,
  }) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebook&Sorting=newest&q=$bookName');
      List<BookEntity> books = [];
      for (var item in data['items']) {
        books.add(BookEntity.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
