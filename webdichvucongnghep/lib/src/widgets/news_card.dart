import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../models/news.dart';

class NewsCard extends StatefulWidget {
  final News news;

  const NewsCard({required this.news, super.key});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isCompact = width < 700;

    final dateStr = DateFormat('dd/MM/yyyy').format(widget.news.publishedAt);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go('/tin-tuc'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? const Color(0xFFE77409) : Colors.grey.shade100,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered ? Colors.black.withOpacity(0.06) : Colors.black.withOpacity(0.02),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: isCompact
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImageArea(height: 180, width: double.infinity),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: _buildContentArea(dateStr),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImageArea(height: 160, width: 220),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: _buildContentArea(dateStr),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildImageArea({required double height, required double width}) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedScale(
              scale: _isHovered ? 1.05 : 1.0,
              duration: const Duration(milliseconds: 300),
              child: widget.news.thumbnailUrl.isNotEmpty
                  ? Image.network(
                      widget.news.thumbnailUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => _buildFallbackImage(),
                    )
                  : _buildFallbackImage(),
            ),
          ),
          // Gradient cover
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.05),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentArea(String dateStr) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Category and Date Line
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFE77409).withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                widget.news.category,
                style: const TextStyle(
                  color: Color(0xFFE77409),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Icon(Icons.calendar_today, size: 12, color: Colors.grey.shade400),
            const SizedBox(width: 4),
            Text(
              dateStr,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Title
        Text(
          widget.news.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: _isHovered ? const Color(0xFFE77409) : const Color(0xFF333333),
            height: 1.3,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        // Description
        Text(
          widget.news.shortDescription,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 13,
            height: 1.5,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 14),
        // Read More Button
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Tìm hiểu thêm',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: _isHovered ? const Color(0xFFE77409) : const Color(0xFF238419),
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.chevron_right,
              size: 16,
              color: _isHovered ? const Color(0xFFE77409) : const Color(0xFF238419),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFallbackImage() {
    return Container(
      color: Colors.grey.shade100,
      alignment: Alignment.center,
      child: const Icon(Icons.newspaper, size: 40, color: Colors.black26),
    );
  }
}
