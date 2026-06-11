import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';

import '../providers/providers.dart';
import '../models/company.dart';
import '../models/service.dart';
import '../models/project.dart';
import '../models/news.dart';
import '../widgets/service_card.dart';
import '../widgets/project_card.dart';
import '../widgets/news_card.dart';
import '../widgets/footer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _companyNameController = TextEditingController();
  final _clientNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  String _selectedService = 'Lắp đặt máy móc và thiết bị công nghiệp';

  @override
  void dispose() {
    _companyNameController.dispose();
    _clientNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_clientNameController.text.isEmpty || _phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng điền đầy đủ Họ tên và Số điện thoại để được hỗ trợ!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }
    
    // Simulate successful form submission
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Cảm ơn ${_clientNameController.text}, Thành Thắng đã tiếp nhận thông tin của bạn!'),
        backgroundColor: const Color(0xFF238419),
      ),
    );

    // Reset fields
    _companyNameController.clear();
    _clientNameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final servicesAsync = ref.watch(serviceControllerProvider);
    final projectsAsync = ref.watch(projectControllerProvider);
    final newsAsync = ref.watch(newsControllerProvider);
    final companyAsync = ref.watch(companyControllerProvider);

    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 750;
    final isTablet = width >= 750 && width < 1100;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Hero Slider Area
          _buildHeroSlider(isMobile),

          // 2. About Us Section
          _buildAboutUs(isMobile, companyAsync),

          // 3. Partner Logo Bar
          _buildPartnerLogos(),

          // 4. Services Grid Section
          _buildServicesSection(isMobile, isTablet, servicesAsync),

          // 5. Featured Projects Section
          _buildProjectsSection(isMobile, isTablet, projectsAsync),

          // 6. Implementation Process Section
          _buildProcessSection(isMobile, isTablet),

          // 7. News / Articles Section
          _buildNewsSection(isMobile, isTablet, newsAsync),

          // 8. Advisory Appointment Form
          _buildAdvisoryForm(isMobile),

          // Footer
          const AppFooter(),
        ],
      ),
    );
  }

  Widget _buildHeroSlider(bool isMobile) {
    final slides = [
      {
        'title': 'Tiên phong vận chuyển lắp đặt\nmáy và thiết bị công nghiệp',
        'sub': 'Tiêu chuẩn quốc tế - Quy trình an toàn - Chi phí tối ưu',
        'image': 'https://kythuatthanhthang.vn/uploads/slider/14.png'
      },
      {
        'title': 'Những dự án tiêu biểu\nThành Thắng đã thực hiện',
        'sub': 'Đến nay, Thành Thắng khẳng định vị thế hàng đầu trong ngành lắp máy công nghiệp trọn gói',
        'image': 'https://kythuatthanhthang.vn/uploads/slider/15.png'
      }
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: isMobile ? 320 : 540,
        autoPlay: true,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        autoPlayInterval: const Duration(seconds: 6),
      ),
      items: slides.map((slide) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                // Banner Image
                Positioned.fill(
                  child: Image.network(
                    slide['image']!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey.shade300),
                  ),
                ),
                // Dark overlay to read text clearly
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.55),
                  ),
                ),
                // Text details
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 64),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            slide['title']!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isMobile ? 24 : 42,
                              fontWeight: FontWeight.w900,
                              height: 1.25,
                              letterSpacing: 1.0,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            slide['sub']!,
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: isMobile ? 13 : 18,
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 32),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () => context.go('/dich-vu'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE77409), // Orange
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isMobile ? 18 : 28,
                                    vertical: isMobile ? 12 : 18,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: Text(
                                  'KHÁM PHÁ THÊM',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: isMobile ? 12 : 14,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              OutlinedButton(
                                onPressed: () => launchUrl(Uri.parse('tel:0966533544')),
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Colors.white, width: 2),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isMobile ? 18 : 28,
                                    vertical: isMobile ? 12 : 18,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: Text(
                                  'TRÒ CHUYỆN VỚI CHUYÊN GIA',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: isMobile ? 12 : 14,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildAboutUs(bool isMobile, AsyncValue<CompanyInfo> companyAsync) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: isMobile ? 24 : 64),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'GIỚI THIỆU',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFE77409),
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Thành Thắng - Sinh ra để phục vụ',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF238419), // Green
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: companyAsync.when(
              data: (company) => Column(
                children: [
                  Text(
                    company.description,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.8,
                      color: Colors.grey.shade700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.go('/gioi-thieu'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE77409),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Khám phá thêm về Thành Thắng',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 16),
                      TextButton.icon(
                        onPressed: () => launchUrl(Uri.parse('tel:0966533544')),
                        icon: const Icon(Icons.phone, color: Color(0xFF238419)),
                        label: const Text(
                          'Gọi ngay: 0966 533 544',
                          style: TextStyle(
                            color: Color(0xFF238419),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Text('Lỗi: $e'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPartnerLogos() {
    final partners = [
      {'name': 'Sharp', 'image': 'https://kythuatthanhthang.vn/images/logo_sharp.svg', 'isSvg': true},
      {'name': 'LG', 'image': 'https://kythuatthanhthang.vn/images/logo_lg.svg', 'isSvg': true},
      {'name': 'Toshiba', 'image': 'https://kythuatthanhthang.vn/images/logo_toshiba.svg', 'isSvg': true},
      {'name': 'Daikin', 'image': 'https://kythuatthanhthang.vn/images/logo_daikin.svg', 'isSvg': true},
      {'name': 'ACC', 'image': 'https://kythuatthanhthang.vn/images/logo_acc.svg', 'isSvg': true},
      {'name': 'Chu Lai', 'image': 'https://kythuatthanhthang.vn/images/logo_chulai.png', 'isSvg': false},
      {'name': 'THP', 'image': 'https://kythuatthanhthang.vn/images/logp_thp.png', 'isSvg': false},
    ];

    return Container(
      color: Colors.grey.shade50,
      height: 100,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: partners.length,
          itemBuilder: (context, index) {
            final p = partners[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.center,
              child: _buildFallbackPartnerLogo(p['name'] as String),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFallbackPartnerLogo(String name) {
    Color textColor = Colors.grey.shade600;
    if (name == 'Sharp') textColor = Colors.red.shade800;
    if (name == 'LG') textColor = const Color(0xFFA50034);
    if (name == 'Toshiba') textColor = Colors.red.shade900;
    if (name == 'Daikin') textColor = Colors.blue.shade800;
    if (name == 'ACC') textColor = Colors.blue.shade900;
    if (name == 'THP') textColor = Colors.green.shade800;
    if (name == 'Chu Lai') textColor = Colors.orange.shade800;

    return Text(
      name.toUpperCase(),
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: textColor,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildServicesSection(bool isMobile, bool isTablet, AsyncValue<List<Service>> servicesAsync) {
    return Container(
      color: Colors.grey.shade100,
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: isMobile ? 24 : 64),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DỊCH VỤ CUNG CẤP',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF238419),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Dịch vụ chuyên nghiệp toàn diện hệ thống công nghiệp',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              TextButton.icon(
                onPressed: () => context.go('/dich-vu'),
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Xem tất cả dịch vụ'),
              ),
            ],
          ),
          const SizedBox(height: 40),
          servicesAsync.when(
            data: (services) {
              final int cols = isMobile ? 1 : (isTablet ? 2 : 4);
              final double screenWidth = MediaQuery.of(context).size.width - (isMobile ? 48 : 128);
              final double cardWidth = (screenWidth - (cols - 1) * 16) / cols;
              final double cardHeight = 330;
              final double aspect = cardWidth / cardHeight;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: aspect,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) => ServiceCard(service: services[index]),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Text('Lỗi: $e'),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection(bool isMobile, bool isTablet, AsyncValue<List<Project>> projectsAsync) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: isMobile ? 24 : 64),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DỰ ÁN TIÊU BIỂU',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF238419),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Các dự án tiêu biểu Thành Thắng đã trực tiếp thi công hoàn thành',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              TextButton.icon(
                onPressed: () => context.go('/du-an'),
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Xem tất cả dự án'),
              ),
            ],
          ),
          const SizedBox(height: 40),
          projectsAsync.when(
            data: (projects) {
              final int cols = isMobile ? 1 : (isTablet ? 2 : 3);
              final double screenWidth = MediaQuery.of(context).size.width - (isMobile ? 48 : 128);
              final double cardWidth = (screenWidth - (cols - 1) * 20) / cols;
              final double cardHeight = 310;
              final double aspect = cardWidth / cardHeight;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: aspect,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) => ProjectCard(project: projects[index]),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Text('Lỗi: $e'),
          ),
        ],
      ),
    );
  }

  Widget _buildProcessSection(bool isMobile, bool isTablet) {
    final steps = [
      {'step': 'BƯỚC 01', 'title': 'Tiếp nhận yêu cầu', 'desc': 'Thành Thắng tiếp nhận yêu cầu từ phía khách hàng.'},
      {'step': 'BƯỚC 02', 'title': 'Khảo sát & Báo giá', 'desc': 'Tiến hành khảo sát thực địa và lên báo giá chi tiết.'},
      {'step': 'BƯỚC 03', 'title': 'Thống nhất & Ký kết', 'desc': 'Thương thảo phương án thi công và tiến hành ký kết hợp đồng.'},
      {'step': 'BƯỚC 04', 'title': 'Triển khai thi công', 'desc': 'Lên kế hoạch chi tiết, điều động nhân sự máy móc và triển khai.'},
      {'step': 'BƯỚC 05', 'title': 'Nghiệm thu bàn giao', 'desc': 'Hoàn thành, bàn giao và nghiệm thu dự án/công trình.'},
    ];

    final int cols = isMobile ? 1 : (isTablet ? 3 : 5);

    return Container(
      color: Colors.grey.shade50,
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: isMobile ? 24 : 64),
      child: Column(
        children: [
          const Text(
            'QUY TRÌNH TRIỂN KHAI',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF238419)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Khi đến với chúng tôi, Quý khách hàng sẽ được tận hưởng dịch vụ chất lượng, an toàn nhất.',
            style: TextStyle(color: Colors.grey, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cols,
              crossAxisSpacing: 16,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 3.0 : 1.1,
            ),
            itemCount: steps.length,
            itemBuilder: (context, index) {
              final s = steps[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: isMobile
                    ? Row(
                        children: [
                          _buildStepCircle(s['step']!),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(s['title']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                const SizedBox(height: 4),
                                Text(s['desc']!, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                              ],
                            ),
                          )
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildStepCircle(s['step']!),
                          const SizedBox(height: 16),
                          Text(
                            s['title']!,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            s['desc']!,
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildStepCircle(String stepNum) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFE77409).withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        stepNum.replaceAll('BƯỚC ', ''),
        style: const TextStyle(
          color: Color(0xFFE77409),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildNewsSection(bool isMobile, bool isTablet, AsyncValue<List<News>> newsAsync) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: isMobile ? 24 : 64),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TIN TỨC MỚI NHẤT',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF238419),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Cập nhật tin tức kỹ thuật và chia sẻ kinh nghiệm vận hành cơ điện',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              TextButton.icon(
                onPressed: () => context.go('/tin-tuc'),
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Xem tất cả tin tức'),
              ),
            ],
          ),
          const SizedBox(height: 40),
          newsAsync.when(
            data: (newsList) {
              final items = newsList.take(4).toList();
              if (isMobile) {
                return Column(
                  children: [
                    for (int i = 0; i < items.length; i++) ...[
                      NewsCard(news: items[i]),
                      if (i < items.length - 1) const SizedBox(height: 20),
                    ]
                  ],
                );
              } else {
                final rows = <Widget>[];
                for (int i = 0; i < items.length; i += 2) {
                  final rowChildren = <Widget>[];
                  rowChildren.add(Expanded(child: NewsCard(news: items[i])));
                  if (i + 1 < items.length) {
                    rowChildren.add(const SizedBox(width: 20));
                    rowChildren.add(Expanded(child: NewsCard(news: items[i + 1])));
                  } else {
                    rowChildren.add(const SizedBox(width: 20));
                    rowChildren.add(const Expanded(child: SizedBox()));
                  }
                  rows.add(Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: rowChildren,
                  ));
                  if (i + 2 < items.length) {
                    rows.add(const SizedBox(height: 20));
                  }
                }
                return Column(children: rows);
              }
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Text('Lỗi: $e'),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvisoryForm(bool isMobile) {
    final serviceOptions = [
      'Lắp đặt máy móc và thiết bị công nghiệp',
      'Tháo dỡ di dời và lắp đặt máy',
      'Bảo trì máy móc và thiết bị điện công nghiệp',
      'Thu mua và trao đổi máy móc thiết bị công nghiệp',
    ];

    return Container(
      color: const Color(0xFF141F25), // Elegant super-dark blue theme for the form section
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: isMobile ? 24 : 64),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'ĐẶT LỊCH HẸN TƯ VẤN',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Vui lòng điền thông tin chi tiết dưới đây. Các chuyên gia kỹ thuật của chúng tôi sẽ liên hệ lại ngay.',
                style: TextStyle(color: Colors.white54, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Form grid / Column
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildFormField(
                          controller: _companyNameController,
                          labelText: 'Thông tin doanh nghiệp *',
                          icon: Icons.business,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildFormField(
                          controller: _clientNameController,
                          labelText: 'Họ và tên của Quý khách hàng *',
                          icon: Icons.person,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Dropdown Selection for service
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.white10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<String>(
                        dropdownColor: const Color(0xFF1A252C),
                        value: _selectedService,
                        items: serviceOptions.map((String val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val, style: const TextStyle(color: Colors.white, fontSize: 14)),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) {
                            setState(() {
                              _selectedService = val;
                            });
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Dịch vụ cần tư vấn',
                          labelStyle: TextStyle(color: Colors.white60, fontSize: 13),
                          border: InputBorder.none,
                          icon: Icon(Icons.design_services, color: Color(0xFFE77409)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (isMobile) ...[
                    _buildFormField(controller: _phoneController, labelText: 'Số điện thoại *', icon: Icons.phone),
                    const SizedBox(height: 16),
                    _buildFormField(controller: _emailController, labelText: 'Email', icon: Icons.email),
                  ] else ...[
                    Row(
                      children: [
                        Expanded(
                          child: _buildFormField(
                            controller: _phoneController,
                            labelText: 'Số điện thoại *',
                            icon: Icons.phone,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildFormField(
                            controller: _emailController,
                            labelText: 'Email',
                            icon: Icons.email,
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 16),
                  _buildFormField(
                    controller: _messageController,
                    labelText: 'Lời nhắn đến Thành Thắng',
                    icon: Icons.message,
                    maxLines: 4,
                  ),
                  const SizedBox(height: 32),
                  // Submit actions
                  isMobile
                      ? Column(
                          children: [
                            _buildSubmitButton(),
                            const SizedBox(height: 16),
                            _buildHotlineButton(),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(child: _buildSubmitButton()),
                            const SizedBox(width: 20),
                            Expanded(child: _buildHotlineButton()),
                          ],
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: const TextStyle(color: Colors.white, fontSize: 14),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white60, fontSize: 13),
          icon: Icon(icon, color: const Color(0xFFE77409)),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _submitForm,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE77409),
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: const Text(
        'GỬI NGAY',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }

  Widget _buildHotlineButton() {
    return OutlinedButton.icon(
      onPressed: () => launchUrl(Uri.parse('tel:0966533544')),
      icon: const Icon(Icons.phone_in_talk, color: Color(0xFF238419)),
      label: const Text(
        'HOTLINE: 0966 533 544',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFF238419), width: 2),
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
