import 'package:sharecars/core/api/api_end_points.dart';

class CarModel {
  final String? typeOfCar;
  final String? colorOfCar;
  final int? numberOfSeats;
  final String? carPic;
  final bool? radio;
  final bool? smoking;

  CarModel({
    this.typeOfCar,
    this.colorOfCar,
    this.numberOfSeats,
    this.carPic,
    this.radio,
    this.smoking,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      typeOfCar: json[ApiKey.typeOfCar],
      colorOfCar: json[ApiKey.colorOfCar],
      numberOfSeats: json[ApiKey.numberOfSeats],
      carPic: json[ApiKey.carPic],
      radio: json[ApiKey.radio] == 1, // تحويل من int إلى bool
      smoking: json[ApiKey.smoking] == 1, // تحويل من int إلى bool
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.typeOfCar: typeOfCar,
      ApiKey.colorOfCar: colorOfCar,
      ApiKey.numberOfSeats: numberOfSeats,
      ApiKey.carPic: carPic,
      ApiKey.radio: radio == true ? 1 : 0, // تحويل من bool إلى int
      ApiKey.smoking: smoking == true ? 1 : 0, // تحويل من bool إلى int
    };
  }

}