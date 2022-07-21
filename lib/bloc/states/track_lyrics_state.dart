import 'package:music_app_credicxo/models/track_lyrics.dart';

abstract class TrackLyricsState {}

class TrackLyricsLoadingState extends TrackLyricsState {}

class TrackLyricsErrorState extends TrackLyricsState {
  final String message;

  TrackLyricsErrorState(this.message);
}

class TrackLyricsLoadedState extends TrackLyricsState {
  final TrackLyrics model;

  TrackLyricsLoadedState(this.model);
}
