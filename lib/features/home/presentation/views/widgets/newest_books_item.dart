import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestBooksItem extends StatelessWidget {
  final BookEntity? bookModel;
  const NewestBooksItem({super.key, this.bookModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.20,
        child: Row(
          spacing: 32,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomBookImage(
              aspectRatio: 2.3 / 3.3,
              imageURL: bookModel!.image ??
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp8tqoFKYU6xOKd9Vj9YB435sViW4g4RbR4g&s',
            ),
            Expanded(
              child: Column(
                spacing: 3,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    maxLines: 2,
                    bookModel?.title ?? 'Book Title',
                    overflow: TextOverflow.ellipsis,
                    style: Styles.subTitleLarge24.copyWith(
                      fontFamily: kGTSectraFine,
                    ),
                  ),
                  Text(
                    bookModel?.authorName ?? 'UNknown author',
                    style: Styles.subTitleSmall17,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).free,
                        style: Styles.titleLargeBold22,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      BookRating(
                        rating: (bookModel!.rating ?? 0).toDouble(),
                        count: (bookModel!.ratingsCount ?? 0).toInt(),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
