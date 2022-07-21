import 'dart:convert';

import 'package:music_app_credicxo/models/track_model.dart';
import 'package:music_app_credicxo/services/network_service.dart';

class TrackListRepository {
  Future<TrackModel> getTrackList() async {
    NetworkService networkService = NetworkService();
    final response = await networkService.getTrackListFromNetwork();
    return TrackModel.fromJson(jsonDecode(response.body));
  }
}
