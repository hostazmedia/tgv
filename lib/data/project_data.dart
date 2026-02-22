import '../models/project.dart';

class ProjectData {
  static List<Project> getProjects() {
    return [
      const Project(
        id: 'tgv-ha-long',
        title: 'TGV Hạ Long',
        subtitle: 'Times Garden Ha Long Residences',
        imageEmoji: '🏙️',
        imageAsset: 'assets/project_halong.png',
        location: 'TP. Hạ Long, Quảng Ninh',
        status: 'Đang vận hành',
        description:
            'Tọa lạc ngay bên cạnh Cột Đồng Hồ trung tâm thành phố, nơi nhìn thẳng ra vùng vịnh kỳ quan, '
            'các bậc thầy kiến trúc và kỹ thuật đã tạo nên khu tổ hợp Times Garden Ha Long Residences '
            'với hình dáng một con tàu khổng lồ đang khai phá những miền đất mới.\n\n'
            'Times Garden Ha Long Residences là một công trình khách sạn – nhà phố thương mại hòa trộn giữa '
            'nét đẹp Paris cổ điển và những tiện ích tân tiến nhất.',
        features: [
          'Bể bơi vô cực',
          'Nhà hàng 5 sao',
          'Phố đi bộ đẳng cấp',
          'Trung tâm thương mại',
          'View trực diện Vịnh Hạ Long',
          'Kiến trúc Paris cổ điển',
        ],
      ),
      const Project(
        id: 'ngoa-van',
        title: 'KDL Ngọa Vân - Hồ Thiên',
        subtitle: 'Khu Du Lịch Tâm Linh',
        imageEmoji: '⛰️',
        imageAsset: 'assets/project_ngoavan.jpg',
        location: 'TX. Đông Triều, Quảng Ninh',
        status: 'Đang phát triển',
        description:
            'Nằm trên núi Bảo Đài thuộc địa phận 2 xã An Sinh và Bình Khê, TX. Đông Triều, Quảng Ninh, '
            'chùa Ngọa Vân là một quần thể kiến trúc chùa tháp lớn của Thiền Phái Trúc Lâm trên quần thể '
            'Dãy núi Yên Tử.\n\n'
            'Ngọa Vân rừng núi điệp trùng cao 644 mét. Rừng đại ngàn che phủ, nhiều suối và hồ lớn. '
            'Nơi đây được ban tặng rất nhiều các loại động vật, thực vật quý. '
            'Trong số 830 loài thực vật, có nhiều loài dược liệu, phương thuốc đặc hữu quý hiếm.',
        features: [
          'Độ cao 644m so với mực nước biển',
          'Quần thể Thiền Phái Trúc Lâm',
          'Hệ sinh thái đa dạng',
          '830 loài thực vật quý hiếm',
          'Suối và hồ tự nhiên',
          'Không gian thiền định',
        ],
      ),
    ];
  }
}
