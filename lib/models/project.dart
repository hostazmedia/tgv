class Project {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String location;
  final String imageEmoji;
  final String imageAsset; // Local asset image path
  final List<String> features;
  final String status;

  const Project({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.location,
    this.imageEmoji = '🏗️',
    this.imageAsset = '',
    this.features = const [],
    this.status = 'Đang triển khai',
  });
}
