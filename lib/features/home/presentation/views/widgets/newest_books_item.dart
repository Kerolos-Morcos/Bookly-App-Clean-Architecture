import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/google_translation_cubit/google_translation_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/language_cubit/language_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewestBooksItem extends StatelessWidget {
  final BookEntity? bookModel;
  const NewestBooksItem({super.key, this.bookModel});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.watch<LanguageCubit>().state;
    String targetLanguage = currentLocale.languageCode == 'en' ? 'en' : 'ar';
    final translationCubit = context.read<GoogleTranslationCubit>();
    translationCubit.translate(
        bookModel?.title ?? 'Book Title', targetLanguage);
    translationCubit.translate(
      bookModel?.authorName ?? 'Unknown author',
      targetLanguage,
    );
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
              child: BlocBuilder<GoogleTranslationCubit, Map<String, String>>(
                builder: (context, state) {
                  String translatedTitle = state[bookModel?.title] ??
                      bookModel?.title ??
                      state[bookModel?.authorName ?? 'Unknown author'] ??
                      bookModel?.authorName ??
                      'Unknown author';
                  String translatedAuthorName =
                      state[bookModel?.authorName ?? 'Unknown author'] ??
                          bookModel?.authorName ??
                          'Unknown author';
                  return Column(
                    spacing: 3,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        maxLines: 2,
                        translatedTitle,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.subTitleLarge24.copyWith(
                          fontFamily: kGTSectraFine,
                        ),
                      ),
                      Text(
                        translatedAuthorName,
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
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
