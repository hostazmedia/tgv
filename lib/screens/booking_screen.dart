import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final String? projectName;
  const BookingScreen({super.key, this.projectName});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _noteController = TextEditingController();
  DateTime? _selectedDate;
  String _selectedTime = '09:00';
  String _selectedProject = 'TGV Hạ Long';
  bool _submitted = false;

  final _projects = ['TGV Hạ Long', 'TGV Times Garden', 'Times Garden Residences'];
  final _times = ['09:00', '10:00', '11:00', '14:00', '15:00', '16:00'];

  @override
  void initState() {
    super.initState();
    if (widget.projectName != null) _selectedProject = widget.projectName!;
  }

  @override
  Widget build(BuildContext context) {
    if (_submitted) return _buildSuccess();
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Điền thông tin bên dưới, chuyên viên TGV sẽ xác nhận và hướng dẫn bạn đến tham quan dự án.',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 20),
              _buildCard([
                _buildSection('Chọn dự án'),
                DropdownButtonFormField<String>(
                  value: _selectedProject,
                  decoration: _inputDecoration('Dự án'),
                  items: _projects.map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
                  onChanged: (v) => setState(() => _selectedProject = v!),
                ),
              ]),
              const SizedBox(height: 12),
              _buildCard([
                _buildSection('Thông tin cá nhân'),
                _buildTextField('Họ và tên *', _nameController, required: true),
                _buildTextField('Số điện thoại *', _phoneController, keyboardType: TextInputType.phone, required: true),
                _buildTextField('Email', _emailController, keyboardType: TextInputType.emailAddress),
              ]),
              const SizedBox(height: 12),
              _buildCard([
                _buildSection('Chọn ngày & giờ tham quan'),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.calendar_today, color: Color(0xFF264653)),
                  title: Text(_selectedDate == null
                      ? 'Chọn ngày tham quan'
                      : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now().add(const Duration(days: 1)),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 90)),
                    );
                    if (date != null) setState(() => _selectedDate = date);
                  },
                ),
                const Divider(),
                const SizedBox(height: 8),
                const Text('Chọn giờ:', style: TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: _times.map((t) => ChoiceChip(
                    label: Text(t),
                    selected: _selectedTime == t,
                    selectedColor: const Color(0xFF264653),
                    labelStyle: TextStyle(color: _selectedTime == t ? Colors.white : null),
                    onSelected: (_) => setState(() => _selectedTime = t),
                  )).toList(),
                ),
              ]),
              const SizedBox(height: 12),
              _buildCard([
                _buildSection('Ghi chú'),
                _buildTextField('Câu hỏi hoặc yêu cầu đặc biệt', _noteController, maxLines: 3),
              ]),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF264653),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Đăng ký tham quan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate() && _selectedDate != null) {
      setState(() => _submitted = true);
    } else if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng chọn ngày tham quan')),
      );
    }
  }

  Widget _buildSuccess() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80, height: 80,
              decoration: const BoxDecoration(color: Color(0xFFE8F5E9), shape: BoxShape.circle),
              child: const Icon(Icons.check, color: Color(0xFF4CAF50), size: 40),
            ),
            const SizedBox(height: 24),
            const Text('Đăng ký thành công!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF264653))),
            const SizedBox(height: 12),
            Text(
              'Chuyên viên TGV sẽ liên hệ với ${_nameController.text} qua số ${_phoneController.text} trong vòng 24 giờ để xác nhận lịch tham quan.',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 32),
            OutlinedButton(
              onPressed: () => setState(() => _submitted = false),
              child: const Text('Đặt lịch mới'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF264653))),
    );
  }

  Widget _buildTextField(String label, TextEditingController ctrl, {TextInputType? keyboardType, bool required = false, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: ctrl,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: required ? (v) => (v == null || v.isEmpty) ? 'Vui lòng nhập $label' : null : null,
        decoration: _inputDecoration(label),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) => InputDecoration(
    labelText: label,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  );
}
