class TripFrom {
  String? startLat;
  String? endLat;
  String? startLng;
  String? endLng;
  int path;
  String? date;
  int numberSeats;
  double price;
  double recomandedPrice;
  String? numberPhone;
  int bookingType;
  bool reverseTripRoute ;



  TripFrom(
      {this.startLat,
      this.startLng,
      this.endLat,
      this.endLng,
      this.path=0,
      this.date,
      this.numberSeats = 0,
      this.price = 0,
      this.recomandedPrice = 0,
      this.numberPhone, 
      this.reverseTripRoute =false,
      this.bookingType = 0});
}
