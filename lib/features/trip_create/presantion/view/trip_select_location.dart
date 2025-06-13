import 'package:flutter/widgets.dart';

class TripSelectLocation extends StatefulWidget {
  const TripSelectLocation({super.key});

  @override
  State<TripSelectLocation> createState() => _TripSelectLocationState();
}

class _TripSelectLocationState extends State<TripSelectLocation> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(itemBuilder: (context, counter) {
      Text("helllo $counter");
    });
  }
}
