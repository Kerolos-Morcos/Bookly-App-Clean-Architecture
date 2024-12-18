import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  final ScrollController scrollController = ScrollController();
  var nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    scrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() async {
    var currentPosition = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(
          pageNumber: nextPage++,
        );
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This line is commented out because it's not needed for the current implementation.
    // it is for the case when the books are reversed.
    // final reversedBooks = widget.books.reversed.toList();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.33,
      child: ListView.builder(
        controller: scrollController,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == widget.books.length - 1 ? 0 : 14.0,
            ),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kBookDetailsView,
                    extra: widget.books[index]);
              },
              child: CustomBookImage(
                aspectRatio: 1.60 / 2.5,
                imageURL: widget.books[index].image ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp8tqoFKYU6xOKd9Vj9YB435sViW4g4RbR4g&s',
              ),
            ),
          );
        },
      ),
    );
  }
}
