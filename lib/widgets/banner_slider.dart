import 'dart:async';
import 'package:flutter/material.dart';
import '../services/remote_config_service.dart';
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
  bool _isLoading = true;

  // Fallback local banners
  static const List<Map<String, String>> _localBanners = [
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
    _loadRemoteBanners();
  }

  Future<void> _loadRemoteBanners() async {
    await RemoteConfigService.fetchConfig();
    if (mounted) {
      setState(() => _isLoading = false);
      _startAutoScroll();
    }
  }

  bool get _useRemote => RemoteConfigService.banners.isNotEmpty;

  int get _bannerCount =>
      _useRemote ? RemoteConfigService.banners.length : _localBanners.length;

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (_pageController.hasClients) {
        final next = (_currentPage + 1) % _bannerCount;
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
    if (_isLoading) {
      return const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator(color: Color(0xFFC8A951))),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _bannerCount,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              // Determine image widget and link
              final String linkUrl;
              final Widget imageWidget;

              if (_useRemote) {
                final remoteBanner = RemoteConfigService.banners[index];
                linkUrl = remoteBanner.linkUrl;
                imageWidget = Image.network(
                  remoteBanner.imageUrl,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(color: Color(0xFFC8A951)),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback to local if remote image fails
                    final fallbackIndex = index < _localBanners.length ? index : 0;
                    return Image.asset(
                      _localBanners[fallbackIndex]['image']!,
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      height: 200,
                      alignment: Alignment.center,
                    );
                  },
                );
              } else {
                final localBanner = _localBanners[index];
                linkUrl = localBanner['link']!;
                imageWidget = Image.asset(
                  localBanner['image']!,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                );
              }

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WebViewScreen(url: linkUrl),
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
                    child: imageWidget,
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
              _bannerCount,
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
