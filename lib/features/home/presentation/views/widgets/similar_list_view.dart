import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimilarListView extends StatelessWidget {
  const SimilarListView({super.key, required this.similarBooks});
  final List<BookEntity> similarBooks;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: similarBooks.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == similarBooks.length - 1 ? 0 : 16.0,
            ),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kBookDetailsView,
                    extra: similarBooks[index]);
              },
              child: CustomBookImage(
                aspectRatio: 1.70 / 2.5,
                imageURL: similarBooks[index].image ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp8tqoFKYU6xOKd9Vj9YB435sViW4g4RbR4g&s',
              ),
            ),
          );
        },
      ),
    );
  }
}
