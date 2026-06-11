class Recruitment {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String requirements;
  final String benefits;
  final String location;
  final String employmentType;
  final String experienceLevel;
  final String salaryRange;
  final int quantity;
  final DateTime deadline;
  final bool isUrgent;
  final bool isPublished;
  final int viewCount;
  final int order;
  final DateTime createdAt;
  final DateTime updatedAt;

  Recruitment({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.requirements,
    required this.benefits,
    required this.location,
    required this.employmentType,
    required this.experienceLevel,
    required this.salaryRange,
    this.quantity = 1,
    required this.deadline,
    this.isUrgent = false,
    this.isPublished = true,
    this.viewCount = 0,
    this.order = 0,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Recruitment.fromJson(Map<String, dynamic> json) {
    return Recruitment(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      requirements: json['requirements'] ?? '',
      benefits: json['benefits'] ?? '',
      location: json['location'] ?? '',
      employmentType: json['employment_type'] ?? 'full_time',
      experienceLevel: json['experience_level'] ?? '',
      salaryRange: json['salary_range'] ?? 'Thương lượng',
      quantity: json['quantity'] ?? 1,
      deadline: json['deadline'] != null
          ? DateTime.parse(json['deadline'])
          : DateTime.now().add(const Duration(days: 30)),
      isUrgent: json['is_urgent'] ?? false,
      isPublished: json['is_published'] ?? true,
      viewCount: json['view_count'] ?? 0,
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
      'description': description,
      'requirements': requirements,
      'benefits': benefits,
      'location': location,
      'employment_type': employmentType,
      'experience_level': experienceLevel,
      'salary_range': salaryRange,
      'quantity': quantity,
      'deadline': deadline.toIso8601String(),
      'is_urgent': isUrgent,
      'is_published': isPublished,
      'view_count': viewCount,
      'order': order,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Recruitment copyWith({
    String? id,
    String? title,
    String? slug,
    String? description,
    String? requirements,
    String? benefits,
    String? location,
    String? employmentType,
    String? experienceLevel,
    String? salaryRange,
    int? quantity,
    DateTime? deadline,
    bool? isUrgent,
    bool? isPublished,
    int? viewCount,
    int? order,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Recruitment(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      requirements: requirements ?? this.requirements,
      benefits: benefits ?? this.benefits,
      location: location ?? this.location,
      employmentType: employmentType ?? this.employmentType,
      experienceLevel: experienceLevel ?? this.experienceLevel,
      salaryRange: salaryRange ?? this.salaryRange,
      quantity: quantity ?? this.quantity,
      deadline: deadline ?? this.deadline,
      isUrgent: isUrgent ?? this.isUrgent,
      isPublished: isPublished ?? this.isPublished,
      viewCount: viewCount ?? this.viewCount,
      order: order ?? this.order,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}