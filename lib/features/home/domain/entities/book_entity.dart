class BookEntity {
  final String bookID;
  final String? image;
  final String title;
  final String? authorName;
  final String? description;
  final num? price;
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
