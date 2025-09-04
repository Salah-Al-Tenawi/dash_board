class AdminModel {
  final String status;
  final String message;
  final String adminType;
  final String sessionId;

  AdminModel({
    required this.status,
    required this.message,
    required this.adminType,
    required this.sessionId,
  });

  // Factory constructor to parse from JSON
  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      adminType: json['admin_type'] ?? '',
      sessionId: json['session_id'] ?? '',
    );
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'admin_type': adminType,
      'session_id': sessionId,
    };
  }
}