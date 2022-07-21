import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_credicxo/bloc/events/track_list_event.dart';
import 'package:music_app_credicxo/bloc/states/track_list_state.dart';
import 'package:music_app_credicxo/repository/track_list_repository.dart';

class TrackListBloc extends Bloc<TrackListEvent, TrackListState> {
  final TrackListRepository _repository;

  TrackListBloc(this._repository) : super(TrackListLoadingState()) {
    on<TrackListLoadEvent>((event, emit) async {
      emit(TrackListLoadingState());
      try {
        final model = await _repository.getTrackList();
        print(model.message!.body!.trackList);
        emit(TrackListLoadedState(model));
      } catch (e) {
        print(e);
        emit(TrackListErrorState(e.toString()));
        throw Exception(e);
      }
    });
  }
}
