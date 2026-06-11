class Service {
  final String id;
  final String name;
  final String slug;
  final String description;
  final String shortDescription;
  final String imageUrl;
  final String iconUrl;
  final List<Service> subServices;
  final int order;
  final bool isActive;

  Service({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.shortDescription,
    required this.imageUrl,
    required this.iconUrl,
    this.subServices = const [],
    this.order = 0,
    this.isActive = true,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      shortDescription: json['short_description'] ?? '',
      imageUrl: json['image_url'] ?? '',
      iconUrl: json['icon_url'] ?? '',
      subServices: (json['sub_services'] as List<dynamic>?)
              ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      order: json['order'] ?? 0,
      isActive: json['is_active'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'short_description': shortDescription,
      'image_url': imageUrl,
      'icon_url': iconUrl,
      'sub_services': subServices.map((e) => e.toJson()).toList(),
      'order': order,
      'is_active': isActive,
    };
  }

  Service copyWith({
    String? id,
    String? name,
    String? slug,
    String? description,
    String? shortDescription,
    String? imageUrl,
    String? iconUrl,
    List<Service>? subServices,
    int? order,
    bool? isActive,
  }) {
    return Service(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      shortDescription: shortDescription ?? this.shortDescription,
      imageUrl: imageUrl ?? this.imageUrl,
      iconUrl: iconUrl ?? this.iconUrl,
      subServices: subServices ?? this.subServices,
      order: order ?? this.order,
      isActive: isActive ?? this.isActive,
    );
  }
}

class ServiceCategory {
  final String id;
  final String name;
  final String slug;
  final String description;
  final String iconUrl;
  final List<Service> services;
  final int order;

  ServiceCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.iconUrl,
    this.services = const [],
    this.order = 0,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) {
    return ServiceCategory(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      iconUrl: json['icon_url'] ?? '',
      services: (json['services'] as List<dynamic>?)
              ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      order: json['order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'icon_url': iconUrl,
      'services': services.map((e) => e.toJson()).toList(),
      'order': order,
    };
  }
}