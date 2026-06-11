class CompanyInfo {
  final String name;
  final String phone;
  final String email;
  final String website;
  final String address;
  final String logoUrl;
  final List<String> clientLogos;
  final String description;

  CompanyInfo({
    required this.name,
    required this.phone,
    required this.email,
    required this.website,
    required this.address,
    required this.logoUrl,
    this.clientLogos = const [],
    required this.description,
  });

  factory CompanyInfo.fromJson(Map<String, dynamic> json) {
    return CompanyInfo(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      website: json['website'] ?? '',
      address: json['address'] ?? '',
      logoUrl: json['logo_url'] ?? '',
      clientLogos: (json['client_logos'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'website': website,
      'address': address,
      'logo_url': logoUrl,
      'client_logos': clientLogos,
      'description': description,
    };
  }
}
