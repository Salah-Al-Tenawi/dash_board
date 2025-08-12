part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  // String date;
  // int seats;
  // LatLng source;
  // LatLng dest;
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchSelectedTime extends SearchState {}
