class PatientBookingEntity {
  final bool status;
  final String message;
  final List<PatientEntity> patients;

  PatientBookingEntity({
    required this.status,
    required this.message,
    required this.patients,
  });
}

class PatientEntity {
  final int id;
  final List<PatientDetailsEntity> details;
  final BranchEntity? branch;
  final String user;
  final String payment;
  final String name;
  final String phone;
  final String address;
  final dynamic price;
  final int totalAmount;
  final int discountAmount;
  final int advanceAmount;
  final int balanceAmount;
  final DateTime? dateNdTime;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PatientEntity({
    required this.id,
    required this.details,
    required this.branch,
    required this.user,
    required this.payment,
    required this.name,
    required this.phone,
    required this.address,
    required this.price,
    required this.totalAmount,
    required this.discountAmount,
    required this.advanceAmount,
    required this.balanceAmount,
    required this.dateNdTime,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}

class BranchEntity {
  final int id;
  final String name;
  final int patientsCount;
  final String location;
  final String phone;
  final String mail;
  final String address;
  final String gst;
  final bool isActive;

  BranchEntity({
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
}

class PatientDetailsEntity {
  final int id;
  final String male;
  final String female;
  final int patient;
  final int treatment;
  final String treatmentName;

  PatientDetailsEntity({
    required this.id,
    required this.male,
    required this.female,
    required this.patient,
    required this.treatment,
    required this.treatmentName,
  });
}
