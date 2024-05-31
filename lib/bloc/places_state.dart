
import 'package:equatable/equatable.dart';
import 'package:travel_app/model/places_model.dart';


abstract class PlacesState extends Equatable {
  const PlacesState();

  @override
  List<Object> get props => [];
}

class PlacesInitial extends PlacesState {}

class PlacesLoading extends PlacesState {}

class PlacesLoaded extends PlacesState {
   final PlacesModel places;
   final List<Nearby> displayPlaces;


  const PlacesLoaded({required this.places, required this.displayPlaces});

  @override
  List<Object> get props => [places, displayPlaces];
}

class PlacesError extends PlacesState {
  final String message;

  const PlacesError({required this.message});

  @override
  List<Object> get props => [message];
}