import 'package:flutter/material.dart';

class ResidentPortalScreen extends StatefulWidget {
  const ResidentPortalScreen({super.key});

  @override
  State<ResidentPortalScreen> createState() => _ResidentPortalScreenState();
}

class _ResidentPortalScreenState extends State<ResidentPortalScreen> {
  bool _isLoggedIn = false;
  final _roomController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_roomController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      setState(() {
        _isLoggedIn = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đăng nhập thành công')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập Mã căn hộ và Mật khẩu')),
      );
    }
  }

  void _logout() {
    setState(() {
      _isLoggedIn = false;
      _roomController.clear();
      _passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoggedIn ? _buildDashboard() : _buildLogin();
  }

  Widget _buildLogin() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.security, size: 80, color: Color(0xFF264653)),
              const SizedBox(height: 24),
              const Text(
                'Cổng Cư Dân TGV',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF264653),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Đăng nhập để quản lý hóa đơn và gửi yêu cầu hỗ trợ',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 48),
              TextField(
                controller: _roomController,
                decoration: InputDecoration(
                  labelText: 'Mã căn hộ (VD: TGV-A12.05)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  prefixIcon: const Icon(Icons.apartment),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF264653),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Đăng nhập', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Vui lòng liên hệ BQL 024 6282 1206 để cấp lại mật khẩu')),
                  );
                },
                child: const Text('Quên mật khẩu?', style: TextStyle(color: Color(0xFFC8A951))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboard() {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Xin chào cư dân,', style: TextStyle(color: Colors.grey)),
                  Text(
                    'Căn hộ ${_roomController.text.toUpperCase()}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF264653)),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.red),
                onPressed: _logout,
                tooltip: 'Đăng xuất',
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildBillCard(),
          const SizedBox(height: 24),
          const Text('Dịch vụ hỗ trợ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF264653))),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildServiceCard(Icons.build_circle, Colors.orange, 'Bảo trì\nsửa chữa')),
              const SizedBox(width: 12),
              Expanded(child: _buildServiceCard(Icons.cleaning_services, Colors.blue, 'Vệ sinh\ncăn hộ')),
              const SizedBox(width: 12),
              Expanded(child: _buildServiceCard(Icons.feedback, Colors.green, 'Hòm thư\ngóp ý')),
            ],
          ),
          const SizedBox(height: 24),
          const Text('Thông báo từ Ban Quản Lý', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF264653))),
          const SizedBox(height: 12),
          _buildNotificationCard('Bảo trì thang máy số 2 tòa A', '02/04/2026', true),
          _buildNotificationCard('Thông báo nộp phí dịch vụ tháng 4', '01/04/2026', false),
          _buildNotificationCard('Lịch phun thuốc muỗi định kỳ', '28/03/2026', false),
        ],
      ),
    );
  }

  Widget _buildBillCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF264653), Color(0xFF2A5364)]),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('HÓA ĐƠN KỲ NÀY', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Text('Chưa thanh toán', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text('1,450,000 ₫', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Hạn chót: 10/04/2026', style: TextStyle(color: Colors.white70, fontSize: 14)),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tính năng thanh toán online đang bảo trì')));
                },
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFC8A951), foregroundColor: Colors.white),
                child: const Text('Thanh toán ngay'),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildServiceCard(IconData icon, Color color, String title) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã gửi yêu cầu đến Bộ phận CSKH')));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4)],
        ),
        child: Column(
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(String title, String date, bool isNew) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isNew ? Border.all(color: const Color(0xFFC8A951)) : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.notifications_active, color: isNew ? const Color(0xFFC8A951) : Colors.grey, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: isNew ? FontWeight.bold : FontWeight.normal)),
                const SizedBox(height: 4),
                Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
