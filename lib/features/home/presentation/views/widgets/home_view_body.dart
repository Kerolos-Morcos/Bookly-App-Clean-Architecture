import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/utils/widgets/custom_scroll_to_top_button.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list_view_bloc_consumer.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view_bloc_consumer.dart';
import 'package:bookly_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final ScrollController scrollController = ScrollController();
  var nextPage = 1;
  bool isLoading = false;
  final ValueNotifier<bool> showScrollToTopButton = ValueNotifier<bool>(false);
  @override
  void initState() {
    scrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() async {
    var currentPosition = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPosition > 200) {
      showScrollToTopButton.value = true;
    } else {
      showScrollToTopButton.value = false;
    }
    if (currentPosition >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(
          pageNumber: nextPage++,
        );
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    showScrollToTopButton.dispose();
    super.dispose();
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const FeaturedBooksListViewBlocConsumer(),
                  const SizedBox(height: 50),
                  Text(
                    S.of(context).newest_books,
                    style: Styles.titleLargeBold22,
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            const NewestBooksListViewBlocConsumer(),
          ],
        ),
        CustomScrollToTopButton(
          scrollController: scrollController,
          showScrollToTopButton: showScrollToTopButton,
          onPressed: scrollToTop,
        ),
      ],
    );
  }
}
