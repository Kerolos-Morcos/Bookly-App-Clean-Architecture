import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  final BookEntity books;
  const BookDetailsView({super.key, required this.books});

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    final similarBooksCubit = SimilarBooksCubit(getIt.get());
    similarBooksCubit.fetchSimilarBooks(category: widget.books.category!);
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      category: widget.books.category!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(
          bookModel: widget.books,
        ),
      ),
    );
  }
}
