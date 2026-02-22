import '../models/news_article.dart';

class NewsData {
  static List<NewsArticle> getArticles() {
    return const [
      NewsArticle(
        id: 'n47',
        title: 'Lễ ký kết hợp tác tài trợ đào tạo Cầu lông Bắc Giang',
        summary: 'Sở VHTTDL Bắc Giang phối hợp với TGV tổ chức Lễ ký kết Biên bản thỏa thuận '
            'hợp tác tài trợ đào tạo, phát triển bộ môn Cầu lông tỉnh Bắc Giang.',
        content: 'Chiều ngày 20/12, Sở Văn hóa, Thể thao và Du lịch Bắc Giang phối hợp với '
            'Công ty cổ phần Vườn Thời Đại Việt Nam tổ chức Lễ ký kết Biên bản thỏa thuận hợp tác '
            'tài trợ đào tạo, phát triển bộ môn Cầu lông tỉnh Bắc Giang.\n\n'
            'Đây là một hoạt động ý nghĩa trong chiến lược phát triển cộng đồng của TGV, '
            'thể hiện cam kết đóng góp cho sự phát triển thể thao địa phương.',
        category: 'Tin công ty',
        date: '20/12/2022',
        imageEmoji: '🏸',
      ),
      NewsArticle(
        id: 'n63',
        title: 'Vui Tết Trung thu trọn vẹn tại Times Garden Vĩnh Yên',
        summary: 'Các cư dân nhí tại Times Garden Vĩnh Yên đã được tổ chức một chương trình '
            'Trung thu vô cùng đặc sắc, ý nghĩa và "vui hết xảy".',
        content: 'Ngày 10/9/2022 vừa qua (tức ngày Rằm tháng 8 âm lịch), tại Dự án Times Garden Vĩnh Yên, '
            'thành phố Vĩnh Yên, Vĩnh Phúc, các cư dân nhí đã được chủ đầu tư tổ chức một chương trình '
            'Trung thu vô cùng đặc sắc, ý nghĩa và "vui hết xảy".\n\n'
            'Chương trình bao gồm nhiều hoạt động vui chơi, văn nghệ, rước đèn và phá cỗ '
            'được tổ chức ngay trong khuôn viên dự án.',
        category: 'Tin công ty',
        date: '10/09/2022',
        imageEmoji: '🎑',
      ),
      NewsArticle(
        id: 'n61',
        title: 'Văn phòng Homesick cực chill giữa lòng thủ đô',
        summary: 'Không gian làm việc có ý nghĩa vô cùng quan trọng và tác động rất lớn tới '
            'tinh thần, cảm xúc cũng như hiệu quả công việc.',
        content: 'Xã hội công nghiệp hóa đã khiến cho công việc của dân văn phòng có thêm nhiều áp lực, '
            'phần lớn thời gian trong ngày họ dành cho công việc, sinh hoạt tại văn phòng.\n\n'
            'Chính vì vậy, không gian làm việc có ý nghĩa vô cùng quan trọng và tác động rất lớn tới '
            'tinh thần, cảm xúc cũng như hiệu quả công việc.',
        category: 'Tin công ty',
        date: '15/08/2022',
        imageEmoji: '🏢',
      ),
      NewsArticle(
        id: 'n59',
        title: 'Tối ưu tinh hoa thiết kế truyền thống tạo nên văn phòng hiện đại, ấm cúng',
        summary: 'Văn phòng mang hơi thở hiện đại, tối ưu công năng sử dụng nhằm tạo cảm giác '
            'thoải mái cho nhân viên, nâng cao hiệu suất công việc.',
        content: 'Văn phòng làm việc mang hơi thở của xã hội hiện đại, tối ưu công năng sử dụng '
            'nhằm tạo cảm giác thoải mái cho cán bộ nhân viên, nâng cao hiệu suất công việc '
            'đang trở thành xu hướng mà nhiều doanh nghiệp Việt theo đuổi.\n\n'
            'TGV đã áp dụng triết lý này vào thiết kế không gian văn phòng, kết hợp giữa '
            'yếu tố truyền thống và hiện đại để tạo nên môi trường làm việc lý tưởng.',
        category: 'Tin công ty',
        date: '01/08/2022',
        imageEmoji: '🎨',
      ),
      NewsArticle(
        id: 'n57',
        title: 'Hướng đi nào cho doanh nghiệp BĐS "sinh sau đẻ muộn"',
        summary: 'Hướng đi như thế nào là phù hợp cho những doanh nghiệp bất động sản mới gia nhập thị trường?',
        content: 'Bất động sản là một lĩnh vực hết sức tiềm năng nhưng cũng nhiều biến động và cạnh tranh. '
            'Việt Nam đã chứng kiến rất nhiều doanh nghiệp thành công nhưng cũng không ít đơn vị đã bị thanh lọc '
            'sau một thời gian hoạt động trong lĩnh vực này.\n\n'
            'Vậy hướng đi như thế nào là phù hợp cho những doanh nghiệp bất động sản "sinh sau đẻ muộn"? '
            'TGV đã chọn chiến lược tập trung vào các thành phố cấp 2, cấp 3 đang phát triển mạnh.',
        category: 'Thị trường',
        date: '15/07/2022',
        imageEmoji: '📊',
      ),
      NewsArticle(
        id: 'n51',
        title: 'TGV ký thỏa thuận hợp tác chiến lược với FPT Capital',
        summary: 'TGV và FPT Capital ký kết hợp tác, tiếp thêm sức mạnh đầu tư cho các dự án bất động sản.',
        content: 'TGV và FPT Capital đã chính thức ký kết thỏa thuận hợp tác chiến lược, '
            'mở ra cơ hội phát triển mạnh mẽ cho cả hai bên.\n\n'
            'Sự hợp tác này sẽ giúp TGV tiếp cận nguồn vốn đầu tư chuyên nghiệp từ FPT Capital, '
            'đồng thời mở rộng quy mô các dự án bất động sản trên toàn quốc.',
        category: 'Tin công ty',
        date: '01/07/2022',
        imageEmoji: '🤝',
      ),
    ];
  }
}
