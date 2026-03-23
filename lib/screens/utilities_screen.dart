import 'package:flutter/material.dart';
import 'calculator_screen.dart';
import 'booking_screen.dart';

class UtilitiesScreen extends StatelessWidget {
  const UtilitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final utilities = [
      _UtilityItem(
        icon: Icons.calculate_outlined,
        iconColor: const Color(0xFF264653),
        bgColor: const Color(0xFFE3EFF2),
        title: 'Máy tính vay vốn',
        subtitle: 'Tính khoản vay mua bất động sản',
        onTap: () => Navigator.push(context, MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Máy tính vay vốn'), backgroundColor: Colors.white, foregroundColor: const Color(0xFF264653)),
            body: const CalculatorScreen(),
          ),
        )),
      ),
      _UtilityItem(
        icon: Icons.calendar_today_outlined,
        iconColor: const Color(0xFFE8A838),
        bgColor: const Color(0xFFFEF6E4),
        title: 'Đặt lịch tham quan',
        subtitle: 'Đăng ký tham quan dự án TGV',
        onTap: () => Navigator.push(context, MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Đặt lịch tham quan'), backgroundColor: Colors.white, foregroundColor: const Color(0xFF264653)),
            body: const BookingScreen(),
          ),
        )),
      ),
      _UtilityItem(
        icon: Icons.favorite_outline,
        iconColor: const Color(0xFFE53935),
        bgColor: const Color(0xFFFFEBEE),
        title: 'Dự án yêu thích',
        subtitle: 'Danh sách dự án đã lưu',
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _FavoritesListScreen())),
      ),
      _UtilityItem(
        icon: Icons.map_outlined,
        iconColor: const Color(0xFF2E7D32),
        bgColor: const Color(0xFFE8F5E9),
        title: 'Bản đồ dự án',
        subtitle: 'Xem vị trí các dự án TGV',
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _MapScreen())),
      ),
      _UtilityItem(
        icon: Icons.videocam_outlined,
        iconColor: const Color(0xFF7B1FA2),
        bgColor: const Color(0xFFF3E5F5),
        title: 'Video dự án',
        subtitle: 'Xem video giới thiệu các dự án',
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _VideoScreen())),
      ),
      _UtilityItem(
        icon: Icons.quiz_outlined,
        iconColor: const Color(0xFF0277BD),
        bgColor: const Color(0xFFE1F5FE),
        title: 'Tư vấn & FAQ',
        subtitle: 'Câu hỏi thường gặp về BĐS',
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _FAQScreen())),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Các công cụ hữu ích giúp bạn tìm kiếm và quyết định mua bất động sản phù hợp.',
              style: TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 16),
          ...utilities.map((u) => _buildUtilityCard(u, context)),
        ],
      ),
    );
  }

  Widget _buildUtilityCard(_UtilityItem item, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 48, height: 48,
          decoration: BoxDecoration(color: item.bgColor, borderRadius: BorderRadius.circular(12)),
          child: Icon(item.icon, color: item.iconColor, size: 24),
        ),
        title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(item.subtitle, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: item.onTap,
      ),
    );
  }
}

class _UtilityItem {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const _UtilityItem({required this.icon, required this.iconColor, required this.bgColor, required this.title, required this.subtitle, required this.onTap});
}

// Favorites list screen
class _FavoritesListScreen extends StatelessWidget {
  const _FavoritesListScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dự án yêu thích'), backgroundColor: Colors.white, foregroundColor: const Color(0xFF264653)),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_outline, size: 64, color: Colors.grey[300]),
            const SizedBox(height: 16),
            const Text('Chưa có dự án yêu thích', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            const Text('Nhấn vào biểu tượng ♡ trên trang dự án để lưu', style: TextStyle(color: Colors.grey, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}

// Map screen - list view with addresses
class _MapScreen extends StatelessWidget {
  const _MapScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bản đồ dự án'), backgroundColor: Colors.white, foregroundColor: const Color(0xFF264653)),
      backgroundColor: const Color(0xFFF5F5F5),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Vị trí các dự án của TGV Times Garden Vietnam', style: TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 16),
          _buildLocationCard('TGV Hạ Long', 'TP. Hạ Long, Quảng Ninh', 'Khu đô thị ven biển cao cấp', Icons.apartment),
          _buildLocationCard('TGV Hà Nội', 'Hà Nội', 'Dự án căn hộ trung tâm thành phố', Icons.location_city),
        ],
      ),
    );
  }

  Widget _buildLocationCard(String name, String location, String desc, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
      ),
      child: Row(
        children: [
          Container(
            width: 48, height: 48,
            decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: const Color(0xFF2E7D32)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(location, style: const TextStyle(color: Color(0xFF264653), fontSize: 13)),
                Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}

// Video screen
class _VideoScreen extends StatelessWidget {
  const _VideoScreen();
  final _videos = const [
    {'title': 'Video giới thiệu TGV Hạ Long', 'duration': '3:45', 'thumb': 'https://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg'},
    {'title': 'Căn hộ mẫu Times Garden Residences', 'duration': '5:20', 'thumb': 'https://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg'},
    {'title': 'Tiện ích nội khu TGV', 'duration': '2:30', 'thumb': 'https://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video dự án'), backgroundColor: Colors.white, foregroundColor: const Color(0xFF264653)),
      backgroundColor: const Color(0xFFF5F5F5),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _videos.length,
        itemBuilder: (ctx, i) {
          final v = _videos[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Container(
                    height: 180,
                    color: const Color(0xFF264653),
                    child: const Center(child: Icon(Icons.play_circle_outline, color: Colors.white, size: 64)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(child: Text(v['title']!, style: const TextStyle(fontWeight: FontWeight.w600))),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
                        child: Text(v['duration']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// FAQ screen
class _FAQScreen extends StatefulWidget {
  const _FAQScreen();
  @override
  State<_FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<_FAQScreen> {
  final _faqs = const [
    {'q': 'Quy trình mua căn hộ TGV như thế nào?', 'a': 'Quy trình gồm 5 bước: (1) Đặt giữ chỗ, (2) Ký hợp đồng mua bán, (3) Đóng tiền theo tiến độ, (4) Nghiệm thu bàn giao, (5) Nhận nhà và làm sổ hồng.'},
    {'q': 'TGV có hỗ trợ vay ngân hàng không?', 'a': 'Có. TGV hợp tác với các ngân hàng uy tín như Vietcombank, Techcombank, BIDV để hỗ trợ khách hàng vay vốn mua nhà với lãi suất ưu đãi, có thể vay tối đa 70% giá trị căn hộ.'},
    {'q': 'Tiện ích nội khu bao gồm những gì?', 'a': 'Mỗi dự án TGV đều có: hồ bơi, phòng gym, khu vui chơi trẻ em, công viên nội khu, siêu thị, trường học và bệnh viện trong khu vực.'},
    {'q': 'Chính sách bảo hành căn hộ?', 'a': 'TGV bảo hành kết cấu chịu lực 60 tháng, hệ thống điện nước và thiết bị 12-24 tháng từ ngày bàn giao.'},
    {'q': 'Làm thế nào để đặt lịch tham quan?', 'a': 'Bạn có thể đặt lịch trực tiếp trong app tại mục "Đặt lịch tham quan", hoặc gọi hotline (+84) 024 6282 1206, chuyên viên sẽ hỗ trợ bạn 24/7.'},
  ];

  int? _expanded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Câu hỏi thường gặp'), backgroundColor: Colors.white, foregroundColor: const Color(0xFF264653)),
      backgroundColor: const Color(0xFFF5F5F5),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _faqs.length,
        itemBuilder: (ctx, i) {
          final faq = _faqs[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]),
            child: ExpansionTile(
              onExpansionChanged: (v) => setState(() => _expanded = v ? i : null),
              initiallyExpanded: _expanded == i,
              title: Text(faq['q']!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(faq['a']!, style: const TextStyle(color: Colors.grey, fontSize: 14, height: 1.6)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
