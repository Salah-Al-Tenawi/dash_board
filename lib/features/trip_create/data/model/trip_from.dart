class TripFrom {
  String? source;
  String? dest;
  List<String>? path;
  String? date;
  int numberSeats;
  double price;
  double recomandedPrice;
  String? numberPhone;
  int bookingType;
  bool reverseTripRoute ;

  TripFrom(
      {this.source,
      this.dest,
      this.path,
      this.date,
      this.numberSeats = 0,
      this.price = 0,
      this.recomandedPrice = 0,
      this.numberPhone, 
      this.reverseTripRoute =false,
      this.bookingType = 0});
}
