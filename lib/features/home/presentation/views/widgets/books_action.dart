import 'package:bookly_app/core/utils/functions/get_current_localization.dart';
import 'package:bookly_app/core/utils/functions/launch_url.dart';
import 'package:bookly_app/core/utils/widgets/custom_action_button.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/generated/l10n.dart';
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
          text:
              getLocalizedSaleability(context, bookModel.saleability ?? 'Free'),
          backgroundColor: Colors.white,
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: isArabic() ? Radius.zero : const Radius.circular(12),
            bottomLeft: isArabic() ? Radius.zero : const Radius.circular(12),
            topRight: isArabic() ? const Radius.circular(12) : Radius.zero,
            bottomRight: isArabic() ? const Radius.circular(12) : Radius.zero,
          ),
        ),
        CustomActionButton(
          onPressed: () async {
            await launchURL(context, bookModel.previewLink);
          },
          text: bookModel.previewLink != null
              ? S.of(context).free_preview
              : S.of(context).not_available,
          backgroundColor: const Color(0xffEF8262),
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: isArabic() ? const Radius.circular(12) : Radius.zero,
            bottomLeft: isArabic() ? const Radius.circular(12) : Radius.zero,
            topRight: isArabic() ? Radius.zero : const Radius.circular(12),
            bottomRight: isArabic() ? Radius.zero : const Radius.circular(12),
          ),
        ),
      ],
    );
  }

  String getLocalizedSaleability(BuildContext context, String? saleability) {
    switch (saleability) {
      case 'FOR_SALE':
        return S.of(context).for_sale;
      case 'NOT_FOR_SALE':
        return S.of(context).not_for_sale;
      default:
        return S.of(context).unknown_saleability;
    }
  }
}
