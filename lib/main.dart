import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/news_screen.dart';
import 'screens/recruitment_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/utilities_screen.dart';
import 'screens/search_screen.dart';
import 'services/remote_config_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  RemoteConfigService.fetchConfig();
  runApp(const TGVApp());
}

class TGVApp extends StatelessWidget {
  const TGVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TGV - Times Garden',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF264653),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final _screens = const [
    HomeScreen(),
    ProjectsScreen(),
    NewsScreen(),
    UtilitiesScreen(),
    ContactScreen(),
  ];

  final _titles = const [
    'TGV',
    'Dự án',
    'Tin tức',
    'Tiện ích',
    'Liên hệ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF264653),
        elevation: 0,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        centerTitle: _currentIndex == 0,
        title: _currentIndex == 0
            ? Image.asset(
                'assets/tgv_logo.png',
                height: 32,
                fit: BoxFit.contain,
              )
            : Text(
                _titles[_currentIndex],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Tìm kiếm'),
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF264653),
                  ),
                  body: const SearchScreen(),
                ),
              ),
            ),
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) =>
              setState(() => _currentIndex = index),
          backgroundColor: Colors.white,
          indicatorColor: const Color(0xFF264653).withValues(alpha: 0.1),
          height: 65,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home, color: Color(0xFF264653)),
              label: 'Trang chủ',
            ),
            NavigationDestination(
              icon: Icon(Icons.apartment_outlined),
              selectedIcon: Icon(Icons.apartment, color: Color(0xFF264653)),
              label: 'Dự án',
            ),
            NavigationDestination(
              icon: Icon(Icons.article_outlined),
              selectedIcon: Icon(Icons.article, color: Color(0xFF264653)),
              label: 'Tin tức',
            ),
            NavigationDestination(
              icon: Icon(Icons.apps_outlined),
              selectedIcon: Icon(Icons.apps, color: Color(0xFF264653)),
              label: 'Tiện ích',
            ),
            NavigationDestination(
              icon: Icon(Icons.call_outlined),
              selectedIcon: Icon(Icons.call, color: Color(0xFF264653)),
              label: 'Liên hệ',
            ),
          ],
        ),
      ),
    );
  }
}
