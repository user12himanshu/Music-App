import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_credicxo/bloc/states/track_lyrics_state.dart';

import '../repository/track_lyrics_repository.dart';
import 'events/track_lyrics_events.dart';

class TrackLyricsBloc extends Bloc<TrackLyricsEvent, TrackLyricsState> {
  final TrackLyricsRepository _repository;
  final int trackId;

  TrackLyricsBloc(this._repository, this.trackId)
      : super(TrackLyricsLoadingState()) {
    on<TrackLyricsLoadEvent>((event, emit) async {
      emit(TrackLyricsLoadingState());
      try {
        final model = await _repository.getTrackLyrics(trackId);
        emit(TrackLyricsLoadedState(model));
      } catch (e) {
        print(e);
        emit(TrackLyricsErrorState(e.toString()));
        throw Exception(e);
      }
    });
  }
}
