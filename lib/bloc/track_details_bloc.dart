import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_credicxo/bloc/states/track_details_state.dart';

import '../repository/track_details_repository.dart';
import 'events/track_details_event.dart';

class TrackDetailsBloc extends Bloc<TrackDetailsEvent, TrackDetailsState> {
  final TrackDetailsRepository _repository;
  final int trackId;

  TrackDetailsBloc(this._repository, this.trackId)
      : super(TrackDetailsLoadingState()) {
    on<TrackDetailsLoadEvent>((event, emit) async {
      emit(TrackDetailsLoadingState());
      try {
        final model = await _repository.getTrackDetails(trackId);
        emit(TrackDetailsLoadedState(model));
      } on SocketException catch (e) {
        print(e);
        emit(TrackDetailsErrorState(e.toString()));
        throw Exception(e);
      }
    });
  }
}
