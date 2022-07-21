import 'dart:convert';

import 'package:music_app_credicxo/services/network_service.dart';

import '../models/track_lyrics.dart';

class TrackLyricsRepository {
  Future<TrackLyrics> getTrackLyrics(int trackId) async {
    NetworkService networkService = NetworkService();
    final response = await networkService.getTrackLyricsFromNetwork(trackId);
    return TrackLyrics.fromJson(jsonDecode(response.body));
  }
}
