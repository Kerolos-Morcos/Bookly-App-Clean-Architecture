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
  @HiveField(7)
  final num? ratingsCount;
  @HiveField(8)
  final String? category;
  @HiveField(9)
  final String? previewLink;
  @HiveField(10)
  final String? saleability;

  BookEntity({
    required this.bookID,
    required this.image,
    required this.title,
    required this.authorName,
    required this.description,
    required this.price,
    required this.rating,
    required this.ratingsCount,
    required this.category,
    required this.previewLink,
    required this.saleability,
  });

  factory BookEntity.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};
    final saleInfo = json['saleInfo'] ?? {};

    return BookEntity(
      bookID: json['id'] ?? '',
      image: (volumeInfo['imageLinks'] != null)
          ? volumeInfo['imageLinks']['thumbnail']
          : null,
      title: volumeInfo['title'] ?? 'Unknown Title',
      authorName:
          (volumeInfo['authors'] != null && volumeInfo['authors'] is List)
              ? (volumeInfo['authors'] as List).join(', ')
              : 'Unknown Author',
      description: volumeInfo['description'],
      price: saleInfo['retailPrice'] != null
          ? saleInfo['retailPrice']['amount']
          : null,
      rating: volumeInfo['averageRating'],
      ratingsCount: volumeInfo['ratingsCount'],
      category:
          (volumeInfo['categories'] != null && volumeInfo['categories'] is List)
              ? (volumeInfo['categories'] as List).join(', ')
              : null,
      previewLink: volumeInfo['previewLink'],
      saleability: saleInfo['saleability'],
    );
  }
}
