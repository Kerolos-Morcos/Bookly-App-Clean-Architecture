import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchFeaturedBooks();
}

class HomeLocalDataSourceImplementation extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    throw UnimplementedError();
  }
}
