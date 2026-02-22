import 'dart:async';
import 'package:flutter/material.dart';
import '../screens/webview_screen.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _autoScrollTimer;

  // Static banners - ảnh local + link WebView
  static const List<Map<String, String>> _banners = [
    {
      'image': 'assets/banner_1.png',
      'link': 'https://tgv.com.vn',
    },
    {
      'image': 'assets/banner_2.png',
      'link': 'https://tgv.com.vn/du-an/tgv-ha-long-p7',
    },
    {
      'image': 'assets/banner_3.png',
      'link': 'https://tgv.com.vn/du-an',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (_pageController.hasClients) {
        final next = (_currentPage + 1) % _banners.length;
        _pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _banners.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              final banner = _banners[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WebViewScreen(url: banner['link']!),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      banner['image']!,
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      height: 200,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // Dot indicators
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _banners.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                height: 6,
                width: _currentPage == index ? 20 : 6,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? const Color(0xFFC8A951)
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
