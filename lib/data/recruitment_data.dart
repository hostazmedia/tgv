import '../models/job_position.dart';

class RecruitmentData {
  static List<JobPosition> getPositions() {
    return const [
      JobPosition(
        id: 'r125',
        title: 'Nhân Viên Kinh Doanh Bất Động Sản',
        location: 'Hồ Chí Minh',
        deadline: 'Đang tuyển',
        description: 'Tìm kiếm khách hàng tiềm năng, tư vấn và bán các sản phẩm bất động sản của TGV.',
        requirements: [
          'Tốt nghiệp Cao đẳng/Đại học',
          'Kỹ năng giao tiếp, đàm phán tốt',
          'Có kinh nghiệm BĐS là lợi thế',
          'Năng động, chịu được áp lực công việc',
        ],
        benefits: [
          'Lương cơ bản + hoa hồng hấp dẫn',
          'Đào tạo chuyên nghiệp',
          'Môi trường làm việc năng động',
          'BHXH, BHYT đầy đủ',
        ],
      ),
      JobPosition(
        id: 'r121',
        title: 'Nhân Viên Thiết Kế',
        location: 'Hà Nội',
        deadline: 'Đang tuyển',
        description: 'Thiết kế ấn phẩm truyền thông, marketing cho các dự án bất động sản.',
        requirements: [
          'Thành thạo Adobe Photoshop, Illustrator',
          'Có khả năng sáng tạo',
          'Kinh nghiệm 1-2 năm',
          'Ưu tiên có portfolio',
        ],
        benefits: [
          'Lương thỏa thuận theo năng lực',
          'Thưởng dự án',
          'Cơ hội thăng tiến',
          'BHXH, BHYT đầy đủ',
        ],
      ),
      JobPosition(
        id: 'r119',
        title: 'Cộng Tác Viên Bất Động Sản',
        location: 'Vĩnh Phúc',
        deadline: 'Đang tuyển',
        description: 'Hỗ trợ tìm kiếm khách hàng và giới thiệu các dự án BĐS tại Vĩnh Phúc.',
        requirements: [
          'Không yêu cầu kinh nghiệm',
          'Am hiểu thị trường BĐS địa phương',
          'Có mối quan hệ rộng',
        ],
        benefits: [
          'Hoa hồng cạnh tranh',
          'Thời gian linh hoạt',
          'Đào tạo miễn phí',
        ],
      ),
      JobPosition(
        id: 'r117',
        title: 'Chuyên Viên R&D',
        location: 'Hà Nội',
        deadline: 'Đang tuyển',
        description: 'Nghiên cứu và phát triển các sản phẩm, dự án bất động sản mới.',
        requirements: [
          'Tốt nghiệp ĐH chuyên ngành Kinh tế/BĐS',
          'Kinh nghiệm 2+ năm trong lĩnh vực BĐS',
          'Kỹ năng phân tích, nghiên cứu thị trường',
          'Tiếng Anh giao tiếp tốt',
        ],
        benefits: [
          'Lương thỏa thuận',
          'Thưởng dự án hấp dẫn',
          'Môi trường chuyên nghiệp',
          'BHXH, BHYT, nghỉ phép đầy đủ',
        ],
      ),
      JobPosition(
        id: 'r115',
        title: 'Trưởng Phòng/Giám Đốc Kinh Doanh BĐS',
        location: 'Hà Nội',
        deadline: 'Đang tuyển',
        description: 'Quản lý đội ngũ kinh doanh, xây dựng chiến lược bán hàng cho các dự án BĐS.',
        requirements: [
          'Kinh nghiệm 5+ năm trong lĩnh vực BĐS',
          'Có kinh nghiệm quản lý đội ngũ',
          'Kỹ năng lãnh đạo và chiến lược',
          'Có mạng lưới khách hàng rộng',
        ],
        benefits: [
          'Thu nhập hấp dẫn (lương + hoa hồng)',
          'Xe công tác',
          'Cơ hội phát triển sự nghiệp',
          'Chế độ đãi ngộ cao',
        ],
      ),
      JobPosition(
        id: 'r113',
        title: 'Chuyên Viên Thiết Kế Đồ Họa',
        location: 'Hà Nội',
        deadline: 'Đang tuyển',
        description: 'Thiết kế đồ họa cho các chiến dịch marketing, branding của TGV.',
        requirements: [
          'Thành thạo bộ công cụ Adobe',
          'Kinh nghiệm 2+ năm',
          'Có portfolio ấn tượng',
          'Khả năng làm việc nhóm',
        ],
        benefits: [
          'Lương thỏa thuận',
          'Thưởng sáng tạo',
          'Đào tạo nâng cao',
          'BHXH, BHYT đầy đủ',
        ],
      ),
      JobPosition(
        id: 'r111',
        title: 'Chuyên Viên Content',
        location: 'Hà Nội',
        deadline: 'Đang tuyển',
        description: 'Sáng tạo nội dung cho website, fanpage và các kênh truyền thông của TGV.',
        requirements: [
          'Tốt nghiệp ĐH chuyên ngành Báo chí/Marketing',
          'Kỹ năng viết tốt, sáng tạo',
          'Am hiểu về SEO, Social Media',
          'Kinh nghiệm 1+ năm',
        ],
        benefits: [
          'Lương thỏa thuận',
          'Môi trường sáng tạo',
          'Cơ hội phát triển nghề nghiệp',
          'BHXH, BHYT đầy đủ',
        ],
      ),
    ];
  }
}
