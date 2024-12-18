import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/utils/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_item.dart';
import 'package:bookly_app/features/search/presentation/manager/search_a_book/search_book_cubit.dart';
import 'package:bookly_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBookState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.searchBooks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: NewestBooksItem(
                  bookModel: state.searchBooks[index],
                ),
              );
            },
          );
        } else if (state is SearchBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return Center(
            child: Text(
              S.of(context).no_results_found,
              style: Styles.titleLargeBold22,
            ),
          );
        }
      },
    );
  }
}
