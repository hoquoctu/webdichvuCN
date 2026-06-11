class Project {
  final String id;
  final String title;
  final String slug;
  final String shortDescription;
  final String description;
  final String thumbnailUrl;
  final List<String> galleryImages;
  final String category;
  final String location;
  final DateTime? startDate;
  final DateTime? endDate;
  final String status;
  final List<String> tags;
  final int viewCount;
  final bool isFeatured;
  final int order;
  final DateTime createdAt;
  final DateTime updatedAt;

  Project({
    required this.id,
    required this.title,
    required this.slug,
    required this.shortDescription,
    required this.description,
    required this.thumbnailUrl,
    this.galleryImages = const [],
    required this.category,
    required this.location,
    this.startDate,
    this.endDate,
    required this.status,
    this.tags = const [],
    this.viewCount = 0,
    this.isFeatured = false,
    this.order = 0,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      shortDescription: json['short_description'] ?? '',
      description: json['description'] ?? '',
      thumbnailUrl: json['thumbnail_url'] ?? '',
      galleryImages: (json['gallery_images'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      category: json['category'] ?? '',
      location: json['location'] ?? '',
      startDate: json['start_date'] != null
          ? DateTime.parse(json['start_date'])
          : null,
      endDate: json['end_date'] != null
          ? DateTime.parse(json['end_date'])
          : null,
      status: json['status'] ?? 'completed',
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      viewCount: json['view_count'] ?? 0,
      isFeatured: json['is_featured'] ?? false,
      order: json['order'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'short_description': shortDescription,
      'description': description,
      'thumbnail_url': thumbnailUrl,
      'gallery_images': galleryImages,
      'category': category,
      'location': location,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'status': status,
      'tags': tags,
      'view_count': viewCount,
      'is_featured': isFeatured,
      'order': order,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Project copyWith({
    String? id,
    String? title,
    String? slug,
    String? shortDescription,
    String? description,
    String? thumbnailUrl,
    List<String>? galleryImages,
    String? category,
    String? location,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
    List<String>? tags,
    int? viewCount,
    bool? isFeatured,
    int? order,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Project(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      shortDescription: shortDescription ?? this.shortDescription,
      description: description ?? this.description,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      galleryImages: galleryImages ?? this.galleryImages,
      category: category ?? this.category,
      location: location ?? this.location,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      tags: tags ?? this.tags,
      viewCount: viewCount ?? this.viewCount,
      isFeatured: isFeatured ?? this.isFeatured,
      order: order ?? this.order,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}