class NewsArticle {
  final String id;
  final String title;
  final String summary;
  final String content;
  final String category;
  final String date;
  final String imageEmoji;

  const NewsArticle({
    required this.id,
    required this.title,
    required this.summary,
    required this.content,
    required this.category,
    required this.date,
    this.imageEmoji = '📰',
  });
}
