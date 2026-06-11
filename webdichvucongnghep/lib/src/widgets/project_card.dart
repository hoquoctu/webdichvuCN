import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/project.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({required this.project, super.key});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go('/du-an'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: _isHovered ? (Matrix4.identity()..translate(0, -6, 0)) : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.25 : 0.15),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: AnimatedScale(
                  scale: _isHovered ? 1.08 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  child: widget.project.thumbnailUrl.isNotEmpty
                      ? Image.network(
                          widget.project.thumbnailUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => _buildFallbackImage(),
                        )
                      : _buildFallbackImage(),
                ),
              ),
              // Gradient Overlay (Darkens towards bottom)
              Positioned.fill(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(_isHovered ? 0.85 : 0.65),
                      ],
                      stops: const [0.3, 1.0],
                    ),
                  ),
                ),
              ),
              // Category/Tag Badge
              Positioned(
                top: 14,
                left: 14,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF238419), // Green
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    widget.project.category.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Content Area
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Location
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 12, color: Color(0xFFE77409)),
                          const SizedBox(width: 4),
                          Text(
                            widget.project.location,
                            style: const TextStyle(
                              color: Color(0xFFE77409),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      // Title
                      Text(
                        widget.project.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      // Expandable short description
                      AnimatedCrossFade(
                        firstChild: const SizedBox(height: 0),
                        secondChild: Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            widget.project.shortDescription,
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 13,
                              height: 1.4,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        crossFadeState: _isHovered ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 200),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFallbackImage() {
    return Container(
      color: const Color(0xFF1E293B),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.construction, size: 44, color: Colors.white24),
          const SizedBox(height: 8),
          Text(
            widget.project.category,
            style: const TextStyle(color: Colors.white38, fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
