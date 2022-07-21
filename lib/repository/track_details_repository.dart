import 'dart:convert';

import 'package:music_app_credicxo/services/network_service.dart';

import '../models/track_details.dart';

class TrackDetailsRepository {
  Future<TrackDetails> getTrackDetails(int trackId) async {
    NetworkService networkService = NetworkService();
    final response = await networkService.getTrackDetailsFromNetwork(trackId);
    return TrackDetails.fromJson(jsonDecode(response.body));
  }
}
