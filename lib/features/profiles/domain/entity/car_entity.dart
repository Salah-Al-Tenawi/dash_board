class CarEntity {
  late final String type;
  late final String color;
 late final int seats;
  final String? image;
  late final bool hasRadio;
  late final bool allowsSmoking;
  CarEntity({
    required this.type,
    required this.color,
    required this.seats,
    required this.image,
    required this.hasRadio,
    required this.allowsSmoking,
  });
}
