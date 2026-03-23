import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _priceController = TextEditingController();
  final _downPaymentController = TextEditingController();
  final _rateController = TextEditingController(text: '8.5');
  final _yearsController = TextEditingController(text: '20');

  double? _monthlyPayment;
  double? _totalPayment;
  double? _totalInterest;

  void _calculate() {
    final price = double.tryParse(_priceController.text.replaceAll(',', ''));
    final downPayment = double.tryParse(_downPaymentController.text.replaceAll(',', '')) ?? 0;
    final rate = double.tryParse(_rateController.text);
    final years = int.tryParse(_yearsController.text);

    if (price == null || rate == null || years == null) return;

    final loan = price - downPayment;
    final monthlyRate = rate / 100 / 12;
    final nPayments = years * 12;

    final monthly = loan * monthlyRate * pow(1 + monthlyRate, nPayments) / (pow(1 + monthlyRate, nPayments) - 1);

    setState(() {
      _monthlyPayment = monthly;
      _totalPayment = monthly * nPayments;
      _totalInterest = monthly * nPayments - loan;
    });
  }

  String _formatCurrency(double value) {
    if (value >= 1000000000) {
      return '${(value / 1000000000).toStringAsFixed(2)} tỷ đ';
    } else if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)} triệu đ';
    }
    return '${value.toStringAsFixed(0)} đ';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tính toán khoản vay mua bất động sản dựa trên giá trị tài sản và lãi suất ngân hàng.',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            _buildCard([
              _buildInput('Giá trị bất động sản (đ)', _priceController, hint: 'VD: 3000000000'),
              _buildInput('Khoản trả trước (đ)', _downPaymentController, hint: 'VD: 900000000'),
              _buildInput('Lãi suất / năm (%)', _rateController, hint: '8.5'),
              _buildInput('Thời hạn vay (năm)', _yearsController, hint: '20'),
            ]),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _calculate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF264653),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Tính toán', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
            if (_monthlyPayment != null) ...[
              const SizedBox(height: 24),
              const Text('Kết quả', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF264653))),
              const SizedBox(height: 12),
              _buildResultCard('Tiền trả hàng tháng', _formatCurrency(_monthlyPayment!), isHighlight: true),
              const SizedBox(height: 8),
              _buildResultCard('Tổng số tiền phải trả', _formatCurrency(_totalPayment!)),
              const SizedBox(height: 8),
              _buildResultCard('Tổng tiền lãi phải trả', _formatCurrency(_totalInterest!)),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3CD),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFFFE69C)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline, color: Color(0xFF856404), size: 16),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Kết quả chỉ mang tính tham khảo. Liên hệ TGV để được tư vấn cụ thể.',
                        style: TextStyle(fontSize: 12, color: Color(0xFF856404)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
      child: Column(children: children),
    );
  }

  Widget _buildInput(String label, TextEditingController controller, {String hint = ''}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildResultCard(String label, String value, {bool isHighlight = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isHighlight ? const Color(0xFF264653) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: isHighlight ? Colors.white70 : Colors.grey[600], fontSize: 14)),
          Text(value, style: TextStyle(
            color: isHighlight ? Colors.white : const Color(0xFF264653),
            fontSize: isHighlight ? 20 : 16,
            fontWeight: FontWeight.bold,
          )),
        ],
      ),
    );
  }
}
