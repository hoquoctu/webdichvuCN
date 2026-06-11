import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/service.dart';

class ServiceCard extends StatefulWidget {
  final Service service;

  const ServiceCard({required this.service, super.key});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  IconData _getServiceIcon(String id) {
    switch (id) {
      case '1':
        return Icons.precision_manufacturing;
      case '2':
        return Icons.local_shipping;
      case '3':
        return Icons.electrical_services;
      case '4':
        return Icons.storefront;
      default:
        return Icons.engineering;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go('/dich-vu/${widget.service.slug}'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: _isHovered ? (Matrix4.identity()..translate(0, -6, 0)) : Matrix4.identity(),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? const Color(0xFFE77409) : Colors.grey.shade200,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered ? const Color(0xFFE77409).withOpacity(0.12) : Colors.black.withOpacity(0.04),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Area
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: const Color(0xFFE77409).withOpacity(0.08),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Icon(
                  _getServiceIcon(widget.service.id),
                  size: 32,
                  color: const Color(0xFFE77409),
                ),
              ),
              const SizedBox(height: 20),
              // Title
              Text(
                widget.service.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              // Short description
              Expanded(
                child: Text(
                  widget.service.shortDescription,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 12),
              // Learn more link
              Row(
                children: [
                  Text(
                    'Xem chi tiết',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: _isHovered ? const Color(0xFFE77409) : const Color(0xFF238419),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(
                    Icons.arrow_forward,
                    size: 14,
                    color: _isHovered ? const Color(0xFFE77409) : const Color(0xFF238419),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
