class TreatmentResponse {
  final bool status;
  final String message;
  final List<TreatmentModel> treatments;

  TreatmentResponse({
    required this.status,
    required this.message,
    required this.treatments,
  });

  factory TreatmentResponse.fromJson(Map<String, dynamic> json) {
    return TreatmentResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      treatments: (json['treatments'] as List<dynamic>?)
              ?.map((e) => TreatmentModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "treatments": treatments.map((e) => e.toJson()).toList(),
    };
  }
}

class TreatmentModel {
  final int id;
  final List<BranchModel> branches;
  final String name;
  final String duration;
  final String price;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TreatmentModel({
    required this.id,
    required this.branches,
    required this.name,
    required this.duration,
    required this.price,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory TreatmentModel.fromJson(Map<String, dynamic> json) {
    return TreatmentModel(
      id: json['id'] ?? 0,
      branches: (json['branches'] as List<dynamic>?)
              ?.map((e) => BranchModel.fromJson(e))
              .toList() ??
          [],
      name: json['name'] ?? '',
      duration: json['duration'] ?? '',
      price: json['price'] ?? '',
      isActive: json['is_active'] ?? false,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "branches": branches.map((e) => e.toJson()).toList(),
      "name": name,
      "duration": duration,
      "price": price,
      "is_active": isActive,
      "created_at": createdAt?.toIso8601String(),
      "updated_at": updatedAt?.toIso8601String(),
    };
  }
}

class BranchModel {
  final int id;
  final String name;
  final int patientsCount;
  final String location;
  final String phone;
  final String mail;
  final String address;
  final String gst;
  final bool isActive;

  BranchModel({
    required this.id,
    required this.name,
    required this.patientsCount,
    required this.location,
    required this.phone,
    required this.mail,
    required this.address,
    required this.gst,
    required this.isActive,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      patientsCount: json['patients_count'] ?? 0,
      location: json['location'] ?? '',
      phone: json['phone'] ?? '',
      mail: json['mail'] ?? '',
      address: json['address'] ?? '',
      gst: json['gst'] ?? '',
      isActive: json['is_active'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "patients_count": patientsCount,
      "location": location,
      "phone": phone,
      "mail": mail,
      "address": address,
      "gst": gst,
      "is_active": isActive,
    };
  }
}
