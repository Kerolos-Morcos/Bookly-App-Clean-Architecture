import 'package:bookly_app/core/utils/functions/launch_url.dart';
import 'package:bookly_app/core/utils/widgets/custom_action_button.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  final BookEntity bookModel;
  const BooksAction({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomActionButton(
          onPressed: null,
          text: bookModel.saleability ?? 'Free',
          backgroundColor: Colors.white,
          color: Colors.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        CustomActionButton(
          onPressed: () async {
            await launchURL(context, bookModel.previewLink);
          },
          text: bookModel.previewLink != null
              ? 'Free preview'
              : 'Not Available',
          backgroundColor: const Color(0xffEF8262),
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ],
    );
  }
}
