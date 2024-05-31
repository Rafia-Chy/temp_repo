
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/bloc/places_state.dart';
import 'package:travel_app/repository/repository.dart';



class PlacesCubit extends Cubit<PlacesState> {
  final PlacesRepository repository;

  PlacesCubit(this.repository) : super(PlacesInitial());

  void fetchLocations() async {
    emit(PlacesLoading());

    try {
      final places = await repository.fetchLocations();
      emit(PlacesLoaded(places: places, displayPlaces: places.data!.nearby!.take(2).toList()));
    } catch (e) {
      emit(PlacesError(message: e.toString()));
    }
  }

  void loadMorePlaces() async {
    final currentState = state;

    if (currentState is PlacesLoaded) {
      try {
        final places = await repository.fetchLocations();
        final allPlaces = currentState.places;
        final newPlacesToDisplay = (currentState.places.data?.nearby!.length ?? 0) + 2;

        emit(PlacesLoaded(places: allPlaces, displayPlaces: allPlaces.data!.nearby!.take(newPlacesToDisplay).toList()));
      } catch (e) {
        emit(PlacesError(message: e.toString()));
      }
    }
  }
}