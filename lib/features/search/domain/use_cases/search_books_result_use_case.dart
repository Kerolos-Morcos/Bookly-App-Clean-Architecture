import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchBooksResultUseCase extends UseCase<List<BookEntity>, String> {
  final SearchRepo searchRepo;
  SearchBooksResultUseCase(this.searchRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call(params) async {
    return await searchRepo.fetchSearchBooksResult(bookName: params!);
  }
}
