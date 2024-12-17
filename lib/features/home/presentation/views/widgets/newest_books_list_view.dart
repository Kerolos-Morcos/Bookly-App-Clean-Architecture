import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({
    super.key,
    required this.newestBooks,
  });
  final List<BookEntity> newestBooks;
  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final newestBooks = widget.newestBooks[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: NewestBooksItem(
              bookModel: newestBooks,
            ),
          );
        },
        childCount: widget.newestBooks.length,
      ),
    );
  }
}
