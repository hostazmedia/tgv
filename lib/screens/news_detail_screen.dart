import 'package:flutter/material.dart';
import '../models/news_article.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsArticle article;

  const NewsDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF264653),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Tin tức', style: TextStyle(fontSize: 16)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFC8A951).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                article.category,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFC8A951),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              article.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF264653),
                height: 1.3,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              article.date,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: const Color(0xFF264653).withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(article.imageEmoji,
                    style: const TextStyle(fontSize: 64)),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              article.content,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade800,
                height: 1.7,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
