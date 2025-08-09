// lib/features/trip_me/presentation/view/trip_me_one.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sharecars/core/utils/widgets/loading_widget_size_150.dart';
import 'package:sharecars/features/trip_create/data/model/trip_model.dart';
import 'package:sharecars/features/trip_me/presantion/manger/cubit/trip_me_cubit.dart';

class TripMeOne extends StatefulWidget {
  const TripMeOne({super.key});

  @override
  State<TripMeOne> createState() => _TripMeOneState();
}

class _TripMeOneState extends State<TripMeOne> {
  TripModel? trip;
  late int tripId;

  @override
  void initState() {
    super.initState();
    tripId = Get.arguments as int;
    _fetchTrip(tripId);
  }

  Future<void> _fetchTrip(int id) async {
    final cubit = context.read<TripMeCubit>();
    await cubit.showOneTrip(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل الرحلة')),
      body: BlocBuilder<TripMeCubit, TripMeState>(
        builder: (context, state) {
          if (state is TripMeLoading) {
            return const Center(child: LoadingWidgetSize150());
          } else if (state is TripMeOneLoaded) {
            final trip = state.trip;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("trip.title" ?? "عنوان الرحلة",
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text('التاريخ: ${"trip.date" ?? ""}'),
                  const SizedBox(height: 8),
                  Text('من: ${"trip.from" ?? ""}'),
                  const SizedBox(height: 8),
                  Text('إلى: ${"trip.to" ?? ""}'),
                ],
              ),
            );
          } else if (state is TripMeErorr) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
