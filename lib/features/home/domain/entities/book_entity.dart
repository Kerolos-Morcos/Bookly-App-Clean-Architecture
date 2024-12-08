import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity extends HiveObject {
  @HiveField(0)
  final String bookID;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final num? price;
  @HiveField(6)
  final num? rating;

  BookEntity({
    required this.bookID,
    required this.image,
    required this.title,
    required this.authorName,
    required this.description,
    required this.price,
    required this.rating,
  });
}
