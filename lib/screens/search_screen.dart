import 'package:flutter/material.dart';
import '../data/news_data.dart';
import '../models/project.dart';
import 'news_detail_screen.dart';
import 'project_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  String _query = '';
  String _filter = 'Tất cả';
  final _filters = ['Tất cả', 'Tin tức', 'Dự án'];

  final _projects = [
    const Project(id: '1', title: 'TGV Hạ Long', subtitle: 'Times Garden Ha Long Residences', location: 'TP. Hạ Long, Quảng Ninh', status: 'Đang vận hành', description: 'Times Garden Ha Long Residences - dự án căn hộ cao cấp tại trung tâm TP. Hạ Long.'),
    const Project(id: '2', title: 'TGV Times Garden', subtitle: 'Times Garden Hà Nội', location: 'Hà Nội', status: 'Đang phát triển', description: 'Dự án khu đô thị Times Garden trung tâm Hà Nội với tiện ích đẳng cấp.'),
  ];

  List<dynamic> get _results {
    if (_query.isEmpty) return [];
    final q = _query.toLowerCase();
    final results = <dynamic>[];

    if (_filter != 'Dự án') {
      final articles = NewsData.getArticles();
      results.addAll(articles.where((a) =>
          a.title.toLowerCase().contains(q) || a.summary.toLowerCase().contains(q)));
    }
    if (_filter != 'Tin tức') {
      results.addAll(_projects.where((p) =>
          p.title.toLowerCase().contains(q) || p.location.toLowerCase().contains(q)));
    }
    return results;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  autofocus: false,
                  onChanged: (v) => setState(() => _query = v),
                  decoration: InputDecoration(
                    hintText: 'Tìm kiếm tin tức, dự án...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _query.isNotEmpty
                        ? IconButton(icon: const Icon(Icons.clear), onPressed: () { _controller.clear(); setState(() => _query = ''); })
                        : null,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _filters.map((f) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: Text(f),
                        selected: _filter == f,
                        selectedColor: const Color(0xFF264653),
                        labelStyle: TextStyle(color: _filter == f ? Colors.white : null),
                        onSelected: (_) => setState(() => _filter = f),
                      ),
                    )).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _query.isEmpty
                ? _buildEmpty()
                : _results.isEmpty
                    ? Center(child: Text('Không tìm thấy kết quả cho "$_query"', style: const TextStyle(color: Colors.grey)))
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _results.length,
                        itemBuilder: (ctx, i) {
                          final item = _results[i];
                          if (item is Project) return _buildProjectItem(item);
                          return _buildNewsItem(item);
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 64, color: Colors.grey[300]),
          const SizedBox(height: 16),
          const Text('Nhập từ khóa để tìm kiếm', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildNewsItem(dynamic article) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: const Color(0xFF264653).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
          child: const Icon(Icons.article, color: Color(0xFF264653)),
        ),
        title: Text(article.title, maxLines: 2, overflow: TextOverflow.ellipsis),
        subtitle: const Text('Tin tức', style: TextStyle(color: Color(0xFF264653))),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NewsDetailScreen(article: article))),
      ),
    );
  }

  Widget _buildProjectItem(Project project) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: const Color(0xFFE8A838).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
          child: const Icon(Icons.apartment, color: Color(0xFFE8A838)),
        ),
        title: Text(project.title),
        subtitle: Text(project.location),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProjectDetailScreen(project: project))),
      ),
    );
  }
}
