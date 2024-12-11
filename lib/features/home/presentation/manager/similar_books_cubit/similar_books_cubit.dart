import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/search/domain/use_cases/search_books_result_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.searchBooksResultUseCase)
      : super(SimilarBooksInitial());
  final SearchBooksResultUseCase searchBooksResultUseCase;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await searchBooksResultUseCase.call(category);
    result.fold(
      (failure) => emit(
        SimilarBooksFailure(errorMessage: failure.errorMessage),
      ),
      (similarBooks) => emit(
        SimilarBooksSuccess(similarBooks: similarBooks),
      ),
    );
  }
}
