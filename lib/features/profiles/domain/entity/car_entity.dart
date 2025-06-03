class CarEntity {
  final String type;
  final String color;
  final int seats;
  final String? image;
  final bool hasRadio;
  final bool allowsSmoking;
  CarEntity({
    required this.type,
    required this.color,
    required this.seats,
    required this.image,
    required this.hasRadio,
    required this.allowsSmoking,
  });
}
