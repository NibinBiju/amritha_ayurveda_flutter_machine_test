class PatientRegisterModel {
  final String name;
  final String executive;
  final String payment;
  final String phone;
  final String address;
  final double totalAmount;
  final double discountAmount;
  final double advanceAmount;
  final double balanceAmount;
  final String dateAndTime; 
  final String id;
  final List<int> male;
  final List<int> female;
  final int branch;
  final List<int> treatments;

  PatientRegisterModel({
    required this.name,
    required this.executive,
    required this.payment,
    required this.phone,
    required this.address,
    required this.totalAmount,
    required this.discountAmount,
    required this.advanceAmount,
    required this.balanceAmount,
    required this.dateAndTime,
    this.id = "",
    required this.male,
    required this.female,
    required this.branch,
    required this.treatments,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "executive": executive,
      "payment": payment,
      "phone": phone,
      "address": address,
      "total_amount": totalAmount,
      "discount_amount": discountAmount,
      "advance_amount": advanceAmount,
      "balance_amount": balanceAmount,
      "date_nd_time": dateAndTime,
      "id": id,
      "male": male.join(','),
      "female": female.join(','),
      "branch": branch,
      "treatments": treatments.join(','),
    };
  }

  factory PatientRegisterModel.fromJson(Map<String, dynamic> json) {
    List<int> parseIdList(dynamic data) {
      if (data == null) return [];
      if (data is String) {
        return data.split(',').map((e) => int.tryParse(e.trim()) ?? 0).toList();
      } else if (data is List) {
        return data
            .map((e) => e is int ? e : int.tryParse(e.toString()) ?? 0)
            .toList();
      }
      return [];
    }

    return PatientRegisterModel(
      name: json["name"] ?? "",
      executive: json["executive"] ?? "",
      payment: json["payment"] ?? "",
      phone: json["phone"] ?? "",
      address: json["address"] ?? "",
      totalAmount: (json["total_amount"] ?? 0).toDouble(),
      discountAmount: (json["discount_amount"] ?? 0).toDouble(),
      advanceAmount: (json["advance_amount"] ?? 0).toDouble(),
      balanceAmount: (json["balance_amount"] ?? 0).toDouble(),
      dateAndTime: json["date_nd_time"] ?? "",
      id: json["id"] ?? "",
      male: parseIdList(json["male"]),
      female: parseIdList(json["female"]),
      branch: (json["branch"] ?? 0),
      treatments: parseIdList(json["treatments"]),
    );
  }
}
