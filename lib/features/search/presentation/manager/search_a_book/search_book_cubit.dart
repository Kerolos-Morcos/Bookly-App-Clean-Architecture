import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/search/domain/use_cases/search_books_result_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.searchBooksResultUseCase) : super(SearchBookInitial());
  final SearchBooksResultUseCase searchBooksResultUseCase;

  Future<void> fetchSearchBooksResult(String bookName) async {
    emit(SearchBooksLoading());
    var result = await searchBooksResultUseCase.call(
      bookName,
    );
    result.fold(
      (failure) => emit(
        SearchBooksFailure(errorMessage: failure.errorMessage),
      ),
      (searchBooks) => emit(
        SearchBooksSuccess(searchBooks: searchBooks),
      ),
    );
  }
}
