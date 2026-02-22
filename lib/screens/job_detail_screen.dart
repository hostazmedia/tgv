import 'package:flutter/material.dart';
import '../models/job_position.dart';

class JobDetailScreen extends StatelessWidget {
  final JobPosition job;

  const JobDetailScreen({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF264653),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Chi tiết vị trí', style: TextStyle(fontSize: 16)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF264653),
              ),
            ),
            const SizedBox(height: 12),
            _infoRow(Icons.location_on_outlined, job.location),
            const SizedBox(height: 6),
            _infoRow(Icons.payments_outlined, 'Lương: ${job.salary}'),
            const SizedBox(height: 6),
            _infoRow(Icons.calendar_today_outlined, job.deadline),
            const SizedBox(height: 20),
            if (job.description.isNotEmpty) ...[
              _sectionTitle('Mô tả công việc'),
              const SizedBox(height: 8),
              Text(
                job.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 20),
            ],
            if (job.requirements.isNotEmpty) ...[
              _sectionTitle('Yêu cầu'),
              const SizedBox(height: 8),
              ...job.requirements.map((r) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Icon(Icons.check_circle,
                              size: 14, color: Color(0xFFC8A951)),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            r,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 20),
            ],
            if (job.benefits.isNotEmpty) ...[
              _sectionTitle('Quyền lợi'),
              const SizedBox(height: 8),
              ...job.benefits.map((b) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Icon(Icons.star,
                              size: 14, color: Color(0xFF264653)),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            b,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade500),
        const SizedBox(width: 8),
        Text(text,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF264653),
      ),
    );
  }
}
