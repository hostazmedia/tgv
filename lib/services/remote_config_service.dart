import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/banner_item.dart';

class RemoteConfigService {
  // Thay bằng raw GitHub URL của bạn
  static const String _configUrl =
      'https://raw.githubusercontent.com/lylyharper-a11y/tgv/main/config.json';

  static List<BannerItem> _banners = [];
  static String _logoUrl = '';

  static List<BannerItem> get banners => _banners;
  static String get logoUrl => _logoUrl;

  /// Fetch config from GitHub raw file
  static Future<void> fetchConfig() async {
    try {
      final response = await http
          .get(Uri.parse('$_configUrl?t=${DateTime.now().millisecondsSinceEpoch}'))
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;

        // Parse banners
        if (data['banners'] != null) {
          _banners = (data['banners'] as List)
              .map((b) => BannerItem.fromJson(b as Map<String, dynamic>))
              .toList();
        }

        // Parse logo URL
        _logoUrl = data['logo_url'] ?? '';
      }
    } catch (e) {
      // Silently fail, use defaults
    }
  }
}
