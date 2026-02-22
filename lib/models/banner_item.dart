class BannerItem {
  final String imageUrl;
  final String linkUrl;
  final String title;

  const BannerItem({
    required this.imageUrl,
    required this.linkUrl,
    this.title = '',
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      imageUrl: json['image_url'] ?? '',
      linkUrl: json['link_url'] ?? '',
      title: json['title'] ?? '',
    );
  }
}
