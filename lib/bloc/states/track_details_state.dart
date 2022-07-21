import 'package:music_app_credicxo/models/track_details.dart';

abstract class TrackDetailsState {}

class TrackDetailsLoadingState extends TrackDetailsState {}

class TrackDetailsErrorState extends TrackDetailsState {
  final String message;

  TrackDetailsErrorState(this.message);
}

class TrackDetailsLoadedState extends TrackDetailsState {
  final TrackDetails model;

  TrackDetailsLoadedState(this.model);
}
