import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.similarBooksResultUseCase)
      : super(SimilarBooksInitial());
  final FetchSimilarBooksUseCase similarBooksResultUseCase;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await similarBooksResultUseCase.call(category);
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
