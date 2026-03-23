import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const _key = 'favorite_projects';

  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  static Future<bool> isFavorite(String projectId) async {
    final favs = await getFavorites();
    return favs.contains(projectId);
  }

  static Future<void> toggleFavorite(String projectId) async {
    final prefs = await SharedPreferences.getInstance();
    final favs = await getFavorites();
    if (favs.contains(projectId)) {
      favs.remove(projectId);
    } else {
      favs.add(projectId);
    }
    await prefs.setStringList(_key, favs);
  }
}
