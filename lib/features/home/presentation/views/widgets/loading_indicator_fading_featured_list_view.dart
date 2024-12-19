import 'package:bookly_app/core/utils/widgets/custom_fading_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/loading_indicator_fading_custom_book_image.dart';
import 'package:flutter/material.dart';

class LoadingIndicatorFadingFeaturedListView extends StatelessWidget {
  const LoadingIndicatorFadingFeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      duration: 600,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.33,
        child: ListView.builder(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(
                right: 14.0,
              ),
              child: LoadingIndicatorFadingCustomBookImage(),
            );
          },
        ),
      ),
    );
  }
}
