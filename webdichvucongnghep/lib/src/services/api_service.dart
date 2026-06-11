import 'dart:async';

import '../models/company.dart';
import '../models/news.dart';
import '../models/project.dart';
import '../models/service.dart';
import '../models/recruitment.dart';

/// Simple ApiService with mock data from the target website.
class ApiService {
  Future<CompanyInfo> fetchCompanyInfo() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return CompanyInfo(
      name: 'CÔNG TY TNHH KỸ THUẬT VÀ VẬN TẢI THÀNH THẮNG',
      phone: '0966 533 544',
      email: 'kythuatthanhthangvn@gmail.com',
      website: 'https://kythuatthanhthang.vn',
      address: '6/23/4A đường số 10, Khu Phố 3, Phường Hiệp Bình, Thành Phố Hồ Chí Minh',
      logoUrl: 'https://kythuatthanhthang.vn/images/logo.svg',
      clientLogos: [
        'https://kythuatthanhthang.vn/images/logo_sharp.svg',
        'https://kythuatthanhthang.vn/images/logo_lg.svg',
        'https://kythuatthanhthang.vn/images/logo_toshiba.svg',
        'https://kythuatthanhthang.vn/images/logo_daikin.svg',
        'https://kythuatthanhthang.vn/images/logo_acc.svg',
        'https://kythuatthanhthang.vn/images/logo_chulai.png',
        'https://kythuatthanhthang.vn/images/logp_thp.png',
      ],
      description: 'Công Ty TNHH Kỹ Thuật Và Vận Tải Thành Thắng được thành lập vào ngày 25 tháng 04 năm 2011, trong những năm đầu tiên Việt Nam thu hút nhiều nhất các nhà đầu tư nước ngoài (FDI), theo chủ trương của Nhà Nước về chuyển đổi công nghiệp hóa, hiện đại hóa trong sản xuất công nghiệp.\n\nTrên chặng hành trình hơn một thập kỷ phát triển, Thành Thắng đã nỗ lực nâng cao năng lực cạnh tranh để bứt phá vươn lên, tôi luyện bản lĩnh vượt mọi thử thách để chinh phục thành công… Đến nay, Thành Thắng đã và đang khẳng định vị thế hàng đầu trong lĩnh vực: Dịch vụ vận chuyển, lắp đặt máy móc, thiết bị công nghiệp siêu trường, siêu trọng trọn gói.',
    );
  }

  Future<List<Service>> fetchServices() async {
    await Future.delayed(const Duration(milliseconds: 100));
    
    final s1 = Service(
      id: '1',
      name: 'Lắp đặt máy móc và thiết bị công nghiệp',
      slug: 'lap-dat-may-moc-va-thiet-bi-cong-nghiep',
      description: 'Dịch vụ lắp đặt máy móc và thiết bị công nghiệp theo Layout, dây chuyền sản xuất tự động, công nghệ cao...',
      shortDescription: 'Lắp đặt máy móc thiết bị theo layout, dây chuyền sản xuất tự động, máy công nghệ cao, hệ thống bồn bể...',
      imageUrl: 'https://kythuatthanhthang.vn/uploads/project/1224_vanchuyenmayphatdien.jpg',
      iconUrl: 'https://kythuatthanhthang.vn/images/ico_service_01.svg',
      subServices: [
        Service(id: '1_1', name: 'Lắp đặt máy và thiết bị công nghiệp theo Layout', slug: 'lap-dat-may-va-thiet-bi-cong-nghiep-theo-layout', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '1_2', name: 'Lắp đặt dây chuyền sản xuất tự động', slug: 'lap-dat-day-chuyen-san-xuat-tu-dong-2', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '1_3', name: 'Lắp đặt máy và thiết bị công nghệ cao', slug: 'lap-dat-may-va-thiet-bi-cong-nghe-cao', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '1_4', name: 'Lắp đặt máy phát điện', slug: 'lap-dat-may-phat-dien', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '1_5', name: 'Lắp đặt hệ thống điện công nghiệp', slug: 'lap-dat-he-thong-dien-cong-nghiep', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '1_6', name: 'Lắp đặt hệ thống bồn bể và đường ống công nghệ', slug: 'lap-dat-he-thong-bon-be-va-duong-ong-cong-nghe', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '1_7', name: 'Lắp đặt hệ thống ống gió nhà máy và nhà cao tầng', slug: 'lap-dat-he-thong-ong-gio-nha-may-va-nha-cao-tang', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '1_8', name: 'Lắp đặt bảo ôn đường ống và thiết bị', slug: 'lap-dat-bao-on-duong-ong-va-thiet-bi', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '1_9', name: 'Lắp đặt máy móc và thiết bị ngành xây dựng', slug: 'lap-dat-may-moc-thiet-bi-nghanh-xay-dung', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '1_10', name: 'Lắp đặt máy móc & Thiết bị ngành dệt may', slug: 'lap-dat-may-moc-thiet-bi-nghanh-det-may', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
      ],
    );

    final s2 = Service(
      id: '2',
      name: 'Tháo dỡ di dời và lắp đặt máy',
      slug: 'thao-do-di-doi-va-lap-dat-may',
      description: 'Dịch vụ tháo dỡ vận chuyển trọn gói các dây chuyền sản xuất tự động, máy móc cơ khí, thiết bị công nghiệp...',
      shortDescription: 'Tháo dỡ vận chuyển máy móc thiết bị công nghiệp, dây chuyền tự động, máy phát điện, di dời nhà máy...',
      imageUrl: 'https://kythuatthanhthang.vn/uploads/project/1223_dienquatgio.jpg',
      iconUrl: 'https://kythuatthanhthang.vn/images/ico_service_02.svg',
      subServices: [
        Service(id: '2_1', name: 'Tháo dỡ vận chuyển máy và thiết bị công nghiệp', slug: 'thao-do-van-chuyen-may-va-thiet-bi-cong-nghiep', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '2_2', name: 'Tháo dỡ vận chuyển dây chuyền sản xuất tự động', slug: 'thao-do-van-chuyen-day-chuyen-san-xuat-tu-dong', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '2_3', name: 'Tháo dỡ vận chuyển máy phát điện', slug: 'thao-do-van-chuyen-may-phat-dien', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '2_4', name: 'Tháo dỡ vận chuyển hệ thống điện công nghiệp', slug: 'thao-do-van-chuyen-he-thong-dien-cong-nghiep-2', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '2_5', name: 'Tháo dỡ vận chuyển hệ thống bồn bể, đường ống công nghệ', slug: 'thao-do-van-chuyen-he-thong-bon-be-duong-ong-cong-nghe', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '2_6', name: 'Tháo dỡ vận chuyển hệ thống ống gió nhà máy, nhà cao tầng', slug: 'thao-do-van-chuyen-he-thong-ong-gio-nha-may-nha-cao-tang', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '2_7', name: 'Tháo dỡ - Di dời máy móc và thiết bị ngành xây dựng', slug: 'thao-do-di-doi-may-moc-va-thiet-bi-nghanh-xay-dung', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '2_8', name: 'Tháo dỡ - Di dời máy móc và thiết bị ngành dệt may', slug: 'thao-do-di-doi-may-moc-va-thiet-bi-nghanh-det-may', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '2_9', name: 'Tháo dỡ - Di dời máy móc và thiết bị sản xuất nhựa', slug: 'thao-do-di-doi-may-moc-va-thiet-bi-san-xuat-nhua', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '2_10', name: 'Tháo dỡ - Di dời máy móc và thiết bị ngành cơ khí', slug: 'thao-do-di-doi-may-moc-va-thiet-bi-nghanh-co-khi', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
      ],
    );

    final s3 = Service(
      id: '3',
      name: 'Bảo trì máy móc và thiết bị điện công nghiệp',
      slug: 'bao-tri-may-moc-va-thiet-bi-cong-nghiep',
      description: 'Dịch vụ bảo trì, bảo dưỡng định kỳ các máy móc sản xuất, dây chuyền tự động hóa và hệ thống điện công nghiệp...',
      shortDescription: 'Bảo trì máy móc thiết bị công nghiệp, dây chuyền sản xuất, tủ điện công nghiệp, hệ thống bồn bể...',
      imageUrl: 'https://kythuatthanhthang.vn/uploads/project/1217_Du_an_1.png',
      iconUrl: 'https://kythuatthanhthang.vn/images/ico_service_03.svg',
      subServices: [
        Service(id: '3_1', name: 'Bảo trì máy và thiết bị công nghiệp', slug: 'bao-tri-may-va-thiet-bi-cong-nghiep', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '3_2', name: 'Bảo trì dây chuyền sản xuất tự động', slug: 'bao-tri-day-chuyen-san-xuat-tu-dong', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '3_3', name: 'Bảo trì máy phát điện', slug: 'bao-tri-may-phat-dien', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '3_4', name: 'Bảo trì hệ thống điện công nghiệp', slug: 'bao-tri-he-thong-dien-cong-nghiep', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '3_5', name: 'Bảo trì bồn bể và đường ống công nghệ', slug: 'bao-tri-bon-be-va-duong-ong-cong-nghe', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '3_6', name: 'Bảo trì điện nước tòa nhà cao tầng và bệnh viện trường học', slug: 'bao-tri-dien-nuoc-toa-nha-cao-tang-va-benh-vien-truong-hoc', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '3_7', name: 'Bảo trì - Bảo dưỡng máy móc và thiết bị xây dựng', slug: 'bao-tri-bao-duong-may-moc-va-thiet-bi-xay-dung', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '3_8', name: 'Bảo trì - Bảo dưỡng máy móc và thiết bị ngành dệt may', slug: 'bao-tri-bao-duong-may-moc-va-thiet-bi-nghanh-det-may', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '3_9', name: 'Bảo trì - Bảo dưỡng máy móc và thiết bị sản xuất nhựa', slug: 'bao-tri-bao-duong-may-moc-va-thiet-bi-san-xuat-nhua', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '3_10', name: 'Bảo trì - Bảo dưỡng máy móc và thiết bị ngành cơ khí', slug: 'bao-tri-bao-duong-may-moc-va-thiet-bi-nghanh-co-khi', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
      ],
    );

    final s4 = Service(
      id: '4',
      name: 'Thu mua và trao đổi máy móc thiết bị công nghiệp',
      slug: 'thu-mua-may-moc-va-thiet-bi-cong-nghiep',
      description: 'Chúng tôi nhận thu mua thanh lý nhà xưởng, máy móc công nghiệp, xe nâng và thiết bị cơ khí đã qua sử dụng...',
      shortDescription: 'Thu mua thanh lý nhà xưởng, máy phát điện, xe nâng, thiết bị nâng hạ, máy xây dựng, máy dệt may...',
      imageUrl: 'https://kythuatthanhthang.vn/uploads/project/1219_1219_hinh_lon.png',
      iconUrl: 'https://kythuatthanhthang.vn/images/ico_service_04.svg',
      subServices: [
        Service(id: '4_1', name: 'Thu mua nhà xưởng và máy móc thiết bị công nghiệp', slug: 'thu-mua-nha-xuong-va-may-moc-thiet-bi-cong-nghiep', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '4_2', name: 'Thu mua máy phát điện và hệ thống điện công nghiệp', slug: 'thu-mua-may-phat-dien-va-he-thong-dien-cong-nghiep', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '4_3', name: 'Thu mua xe nâng và thiết bị nâng hạ', slug: 'thu-mua-xe-nang-va-thiet-bi-nang-ha', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '4_4', name: 'Thu mua máy móc và thiết bị ngành xây dựng', slug: 'thu-mua-may-moc-va-thiet-bi-nghanh-xay-dung', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '4_5', name: 'Thu mua máy móc và thiết bị sản ngành dệt may', slug: 'thu-mua-may-moc-va-thiet-bi-san-nghanh-det-may', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '4_6', name: 'Thu mua máy móc và thiết bị sản xuất nhựa', slug: 'thu-mua-may-moc-va-thiet-bi-san-xuat-nhua', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '4_7', name: 'Thu mua máy móc và thiết bị ngành cơ khí', slug: 'thu-mua-may-moc-va-thiet-bi-nghanh-co-khi', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '4_8', name: 'Thu mua máy móc và thiết bị sản xuất gỗ', slug: 'thu-mua-may-moc-va-thiet-bi-san-xuat-go', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '4_9', name: 'Thu mua máy móc và thiết bị ngành thực phẩm', slug: 'thu-mua-may-moc-va-thiet-bi-nghanh-thuc-pham', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
        Service(id: '4_10', name: 'Thu mua máy móc và thiết bị công nghiệp', slug: 'thu-mua-may-moc-va-thiet-bi-cong-nghiep', description: '', shortDescription: '', imageUrl: '', iconUrl: ''),
      ],
    );

    return [s1, s2, s3, s4];
  }

  Future<List<Project>> fetchProjects() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final now = DateTime.now();
    
    return [
      Project(
        id: 'p1',
        title: 'THÁO DỠ VÀ LẮP ĐẶT MÁY PHÁT ĐIỆN CÔNG NGHIỆP',
        slug: 'thao-do-va-lap-dat-may-phat-dien-cong-nghiep',
        shortDescription: 'Tư vấn và triển khai tổng thể bởi Thành Thắng',
        description: 'Thực hiện tháo dỡ tổ hợp máy phát điện cũ và lắp đặt hệ thống máy phát điện công nghiệp dự phòng công suất lớn cho nhà xưởng sản xuất.',
        thumbnailUrl: 'https://kythuatthanhthang.vn/uploads/project/1224_vanchuyenmayphatdien.jpg',
        category: 'Vận chuyển - Lắp đặt',
        location: 'TP. Hồ Chí Minh',
        status: 'completed',
        createdAt: now.subtract(const Duration(days: 60)),
        updatedAt: now.subtract(const Duration(days: 55)),
      ),
      Project(
        id: 'p2',
        title: 'VẬN CHUYỂN VÀ LẮP ĐẶT ĐIỆN GIÓ',
        slug: 'van-chuyen-va-lap-dat-dien-gi',
        shortDescription: 'Tư vấn và triển khai tổng thể bởi Thành Thắng',
        description: 'Vận chuyển thiết bị siêu trường siêu trọng và thi công lắp dựng cánh quạt, rotor và turbin cho dự án điện gió.',
        thumbnailUrl: 'https://kythuatthanhthang.vn/uploads/project/1223_dienquatgio.jpg',
        category: 'Điện gió',
        location: 'Quảng Nam',
        status: 'completed',
        createdAt: now.subtract(const Duration(days: 90)),
        updatedAt: now.subtract(const Duration(days: 80)),
      ),
      Project(
        id: 'p3',
        title: 'THÁO DỠ VÀ LẮP ĐẶT BỒN BỂ CÔNG NGHIỆP',
        slug: 'thao-do-va-lap-dat-bon-be-cong-nghiep',
        shortDescription: 'Tư vấn và triển khai tổng thể bởi Thành Thắng',
        description: 'Tháo dỡ, di dời và lắp đặt hệ thống bồn bể công nghệ chứa nguyên liệu, bồn tank áp lực cho nhà máy thực phẩm và hóa chất.',
        thumbnailUrl: 'https://kythuatthanhthang.vn/uploads/project/1217_Du_an_1.png',
        category: 'Bồn bể công nghệ',
        location: 'Hậu Giang',
        status: 'completed',
        createdAt: now.subtract(const Duration(days: 45)),
        updatedAt: now.subtract(const Duration(days: 40)),
      ),
      Project(
        id: 'p4',
        title: 'THÁO DỠ VÀ LẮP ĐẶT MÁY CHENSUNG',
        slug: 'thao-do-va-lap-dat-may-chensung-2',
        shortDescription: 'Tư vấn và triển khai tổng thể bởi Thành Thắng',
        description: 'Tháo dỡ vận chuyển hệ thống máy sản xuất dệt nhãn mác Chensung công nghệ cao chuyển giao sang nhà xưởng mới.',
        thumbnailUrl: 'https://kythuatthanhthang.vn/uploads/project/1219_1219_hinh_lon.png',
        category: 'Dệt may',
        location: 'Hà Nam',
        status: 'completed',
        createdAt: now.subtract(const Duration(days: 30)),
        updatedAt: now.subtract(const Duration(days: 28)),
      ),
      Project(
        id: 'p5',
        title: 'THÁO DỠ VÀ LẮP ĐẶT MÁY HUNSKY',
        slug: 'thao-do-va-lap-dat-may-hunsky-2',
        shortDescription: 'Tư vấn và triển khai tổng thể bởi Thành Thắng',
        description: 'Lắp dựng, đấu nối kỹ thuật và chạy thử tổ hợp máy ép phun nhựa Hunsky hiện đại cho đối tác.',
        thumbnailUrl: 'https://kythuatthanhthang.vn/uploads/project/1225_mayhunsky.jpg',
        category: 'Sản xuất nhựa',
        location: 'Bình Dương',
        status: 'completed',
        createdAt: now.subtract(const Duration(days: 15)),
        updatedAt: now.subtract(const Duration(days: 12)),
      ),
      Project(
        id: 'p6',
        title: 'THÁO DỠ VÀ LẮP ĐẶT MÁY NÉN KHÍ',
        slug: 'thao-do-va-lap-dat-may-nen-khi',
        shortDescription: 'Tư vấn và triển khai tổng thể bởi Thành Thắng',
        description: 'Lắp đặt hệ thống trạm khí nén trung tâm trục vít công nghiệp kết nối đường ống chịu áp lực cao cho toàn bộ nhà xưởng.',
        thumbnailUrl: 'https://kythuatthanhthang.vn/uploads/project/1226_maynenkhi.png',
        category: 'Khí nén',
        location: 'Đồng Nai',
        status: 'completed',
        createdAt: now.subtract(const Duration(days: 10)),
        updatedAt: now.subtract(const Duration(days: 8)),
      ),
    ];
  }

  Future<List<News>> fetchNews() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final now = DateTime.now();
    
    return [
      News(
        id: 'n1',
        title: 'Dịch vụ bảo trì bảo dưỡng máy móc công nghiệp uy tín TPHCM',
        slug: 'dich-vu-bao-tri-bao-duong-may-moc-cong-nghiep-uy-tin-tphcm',
        shortDescription: 'Thành Thắng cung cấp dịch vụ bảo trì bảo dưỡng máy móc công nghiệp định kỳ và sửa chữa khẩn cấp trọn gói chuyên nghiệp tại TPHCM.',
        content: 'Thành Thắng cung cấp dịch vụ bảo trì bảo dưỡng máy móc công nghiệp định kỳ và sửa chữa khẩn cấp trọn gói chuyên nghiệp tại TPHCM.',
        thumbnailUrl: 'https://kythuatthanhthang.vn/uploads/article/thumb_1360.jpg',
        category: 'Dịch vụ',
        tags: ['bao_tri', 'may_moc'],
        author: 'Admin',
        publishedAt: now.subtract(const Duration(days: 5)),
        createdAt: now.subtract(const Duration(days: 5)),
        updatedAt: now.subtract(const Duration(days: 1)),
      ),
      News(
        id: 'n2',
        title: 'Hướng dẫn bảo trì tủ điện công nghiệp đúng chuẩn kỹ thuật',
        slug: 'bao-tri-tu-dien-cong-nghiep',
        shortDescription: 'Chia sẻ các quy trình và bước thực hiện kiểm tra, đo đạc thông số kỹ thuật, bảo trì hệ thống tủ điện điều khiển công nghiệp trong nhà máy.',
        content: 'Chia sẻ các quy trình và bước thực hiện kiểm tra, đo đạc thông số kỹ thuật, bảo trì hệ thống tủ điện điều khiển công nghiệp trong nhà máy.',
        thumbnailUrl: 'https://kythuatthanhthang.vn/uploads/article/thumb_1359.jpg',
        category: 'Kỹ thuật',
        tags: ['tu_dien', 'bao_tri'],
        author: 'Kỹ sư Thành Thắng',
        publishedAt: now.subtract(const Duration(days: 8)),
        createdAt: now.subtract(const Duration(days: 8)),
        updatedAt: now.subtract(const Duration(days: 2)),
      ),
      News(
        id: 'n3',
        title: 'Bảo trì khuôn ép nhựa đúng cách như thế nào?',
        slug: 'bao-tri-khuon-ep-nhua',
        shortDescription: 'Hướng dẫn phương pháp vệ sinh bề mặt khuôn, kiểm tra các chốt dẫn hướng và bôi trơn định kỳ khuôn ép nhựa giúp kéo dài tuổi thọ khuôn.',
        content: 'Hướng dẫn phương pháp vệ sinh bề mặt khuôn, kiểm tra các chốt dẫn hướng và bôi trơn định kỳ khuôn ép nhựa giúp kéo dài tuổi thọ khuôn.',
        thumbnailUrl: 'https://kythuatthanhthang.vn/uploads/article/thumb_1358.jpg',
        category: 'Kỹ thuật',
        tags: ['khuon_nhua', 'bao_duong'],
        author: 'Kỹ sư Thành Thắng',
        publishedAt: now.subtract(const Duration(days: 12)),
        createdAt: now.subtract(const Duration(days: 12)),
        updatedAt: now.subtract(const Duration(days: 3)),
      ),
      News(
        id: 'n4',
        title: 'Hướng dẫn bảo dưỡng hệ thống cơ điện đúng cách',
        slug: 'bao-duong-he-thong-co-dien',
        shortDescription: 'Tìm hiểu quy trình bảo dưỡng hệ thống cơ điện M&E (điện, nước, thông gió, điều hòa không khí) trong các tòa nhà cao tầng và khu công nghiệp.',
        content: 'Tìm hiểu quy trình bảo dưỡng hệ thống cơ điện M&E (điện, nước, thông gió, điều hòa không khí) trong các tòa nhà cao tầng và khu công nghiệp.',
        thumbnailUrl: 'https://kythuatthanhthang.vn/uploads/article/thumb_1357.jpg',
        category: 'Kỹ thuật',
        tags: ['co_dien', 'me'],
        author: 'Ban kỹ thuật',
        publishedAt: now.subtract(const Duration(days: 15)),
        createdAt: now.subtract(const Duration(days: 15)),
        updatedAt: now.subtract(const Duration(days: 4)),
      ),
      News(
        id: 'n5',
        title: 'Các sự cố phổ biến của hệ thống điện công nghiệp nhà xưởng',
        slug: 'cac-su-co-pho-bien-cua-he-thong-dien-cong-nghiep-nha-xuong',
        shortDescription: 'Nhận diện các sự cố điện nhà xưởng thường gặp như quá tải điện áp, ngắn mạch, sụt áp và các biện pháp bảo dưỡng phòng tránh rủi ro.',
        content: 'Nhận diện các sự cố điện nhà xưởng thường gặp như quá tải điện áp, ngắn mạch, sụt áp và các biện pháp bảo dưỡng phòng tránh rủi ro.',
        thumbnailUrl: 'https://kythuatthanhthang.vn/uploads/article/thumb_1356.jpg',
        category: 'Hỗ trợ',
        tags: ['su_co_dien', 'nha_xuong'],
        author: 'Kỹ sư Thành Thắng',
        publishedAt: now.subtract(const Duration(days: 20)),
        createdAt: now.subtract(const Duration(days: 20)),
        updatedAt: now.subtract(const Duration(days: 5)),
      ),
      News(
        id: 'n6',
        title: 'Quy trình bảo dưỡng máy mài phẳng chuyên nghiệp',
        slug: 'bao-duong-may-mai-phang',
        shortDescription: 'Chi tiết các bước tháo lắp bảo dưỡng hệ thống bạc đạn, kiểm tra hành trình bàn mài và hệ thống bôi trơn dầu máy mài phẳng chính xác.',
        content: 'Chi tiết các bước tháo lắp bảo dưỡng hệ thống bạc đạn, kiểm tra hành trình bàn mài và hệ thống bôi trơn dầu máy mài phẳng chính xác.',
        thumbnailUrl: 'https://kythuatthanhthang.vn/uploads/article/thumb_1355.jpg',
        category: 'Kỹ thuật',
        tags: ['may_mai', 'bao_tri'],
        author: 'Kỹ sư Thành Thắng',
        publishedAt: now.subtract(const Duration(days: 25)),
        createdAt: now.subtract(const Duration(days: 25)),
        updatedAt: now.subtract(const Duration(days: 6)),
      ),
    ];
  }

  Future<List<Recruitment>> fetchRecruitments() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final now = DateTime.now();
    return [
      Recruitment(
        id: 'r1',
        title: 'Kỹ sư Giám sát lắp đặt máy công nghiệp',
        slug: 'ky-su-giam-sat-lap-dat-may-cong-nghiep',
        description: 'Giám sát thi công lắp đặt máy móc thiết bị công nghiệp theo bản vẽ thiết kế layout, quản lý tổ đội thi công.',
        requirements: 'Tốt nghiệp Đại học chuyên ngành Cơ khí/Điện; tối thiểu 2 năm kinh nghiệm giám sát công trình.',
        benefits: 'Lương hấp dẫn từ 15-20 triệu; BHXH đầy đủ; phụ cấp công tác phí và thưởng dự án.',
        location: 'TP. Hồ Chí Minh / Đi công trình',
        employmentType: 'full_time',
        experienceLevel: '2+ năm',
        salaryRange: '15 - 20 Triệu',
        quantity: 3,
        deadline: now.add(const Duration(days: 30)),
        createdAt: now,
        updatedAt: now,
      ),
      Recruitment(
        id: 'r2',
        title: 'Thợ Cơ khí lắp ráp máy và đi đường ống',
        slug: 'tho-co-khi-lap-rap-may-va-di-duong-ong',
        description: 'Thi công lắp đặt máy móc thiết bị ngành dệt may, xây dựng, nhựa và đi đường ống công nghệ nóng/lạnh.',
        requirements: 'Có chứng chỉ nghề Cơ khí trở lên hoặc tối thiểu 1 năm kinh nghiệm thi công cơ khí công nghiệp.',
        benefits: 'Lương từ 10-14 triệu; hỗ trợ chỗ ở khi đi công trình xa; tăng ca nhân hệ số theo quy định.',
        location: 'Hậu Giang / Quảng Nam / Hà Nam',
        employmentType: 'full_time',
        experienceLevel: '1+ năm',
        salaryRange: '10 - 14 Triệu',
        quantity: 5,
        deadline: now.add(const Duration(days: 30)),
        createdAt: now,
        updatedAt: now,
      ),
    ];
  }
}
