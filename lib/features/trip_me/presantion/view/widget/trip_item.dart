// lib/features/trip_me/presentation/widgets/item_trip.dart
import 'package:flutter/material.dart';
import 'package:sharecars/features/trip_create/data/model/trip_model.dart';

class ItemTrip extends StatelessWidget {
  final TripModel trip;
  final VoidCallback? onTap;
  final VoidCallback? onCancel;

  const ItemTrip({
    super.key,
    required this.trip,
    this.onTap,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    // === عدّل السطور التالية لتطابق حقول TripModel لديك ===
    // مثال افتراضي: trip.title, trip.date, trip.location
    final title = /* trip.title */ "عنوان الرحلة"; // استبدل
    final subtitle = /* "${trip.location} • ${trip.date}" */ "موقع • تاريخ"; // استبدل
    final status = /* trip.status */ "حالة"; // استبدل أو احذف

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        leading: const CircleAvatar(child: Icon(Icons.directions_car)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'details' && onTap != null) onTap!();
            if (value == 'cancel' && onCancel != null) onCancel!();
          },
          itemBuilder: (_) => [
            const PopupMenuItem(value: 'details', child: Text('تفاصيل')),
            const PopupMenuItem(value: 'cancel', child: Text('إلغاء الرحلة')),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
