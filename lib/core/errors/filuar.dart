// ignore_for_file: public_member_api_docs, sort_constructors_first
class Filuar {
  final String message;
  const Filuar({
    required this.message,
  });

  factory Filuar.fromJson(Map<String, dynamic> json) {
    return Filuar(
      message: json['message'],
    );
  }
}
