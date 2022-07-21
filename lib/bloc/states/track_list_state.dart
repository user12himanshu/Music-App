import '../../models/track_model.dart';

abstract class TrackListState {}

class TrackListLoadingState extends TrackListState {}

class TrackListErrorState extends TrackListState {
  final String message;

  TrackListErrorState(this.message);
}

class TrackListLoadedState extends TrackListState {
  final TrackModel model;

  TrackListLoadedState(this.model);
}
