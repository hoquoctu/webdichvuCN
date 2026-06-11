class News {
  final String id;
  final String title;
  final String slug;
  final String shortDescription;
  final String content;
  final String thumbnailUrl;
  final String category;
  final List<String> tags;
  final String author;
  final DateTime publishedAt;
  final int viewCount;
  final bool isFeatured;
  final bool isPublished;
  final int order;
  final DateTime createdAt;
  final DateTime updatedAt;

  News({
    required this.id,
    required this.title,
    required this.slug,
    required this.shortDescription,
    required this.content,
    required this.thumbnailUrl,
    required this.category,
    this.tags = const [],
    required this.author,
    required this.publishedAt,
    this.viewCount = 0,
    this.isFeatured = false,
    this.isPublished = true,
    this.order = 0,
    required this.createdAt,
    required this.updatedAt,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      shortDescription: json['short_description'] ?? '',
      content: json['content'] ?? '',
      thumbnailUrl: json['thumbnail_url'] ?? '',
      category: json['category'] ?? '',
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      author: json['author'] ?? '',
      publishedAt: json['published_at'] != null
          ? DateTime.parse(json['published_at'])
          : DateTime.now(),
      viewCount: json['view_count'] ?? 0,
      isFeatured: json['is_featured'] ?? false,
      isPublished: json['is_published'] ?? true,
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
      'content': content,
      'thumbnail_url': thumbnailUrl,
      'category': category,
      'tags': tags,
      'author': author,
      'published_at': publishedAt.toIso8601String(),
      'view_count': viewCount,
      'is_featured': isFeatured,
      'is_published': isPublished,
      'order': order,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  News copyWith({
    String? id,
    String? title,
    String? slug,
    String? shortDescription,
    String? content,
    String? thumbnailUrl,
    String? category,
    List<String>? tags,
    String? author,
    DateTime? publishedAt,
    int? viewCount,
    bool? isFeatured,
    bool? isPublished,
    int? order,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return News(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      shortDescription: shortDescription ?? this.shortDescription,
      content: content ?? this.content,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      category: category ?? this.category,
      tags: tags ?? this.tags,
      author: author ?? this.author,
      publishedAt: publishedAt ?? this.publishedAt,
      viewCount: viewCount ?? this.viewCount,
      isFeatured: isFeatured ?? this.isFeatured,
      isPublished: isPublished ?? this.isPublished,
      order: order ?? this.order,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class NewsCategory {
  final String id;
  final String name;
  final String slug;
  final String description;
  final int order;

  NewsCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    this.order = 0,
  });

  factory NewsCategory.fromJson(Map<String, dynamic> json) {
    return NewsCategory(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      order: json['order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'order': order,
    };
  }
}