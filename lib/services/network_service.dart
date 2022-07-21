import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../constants.dart';

class NetworkService {
  Map<String, String> paths = {
    'trackList': '/ws/1.1/chart.tracks.get',
    'trackDetails': '/ws/1.1/track.get',
    'trackLyrics': '/ws/1.1/track.lyrics.get'
  };

  Map<String, dynamic> trackListQueryParam = {
    'apikey': kApiKey,
  };

  Map<String, dynamic> getTrackDetailsAndLyricsQueryParam(String trackId) =>
      {'apikey': kApiKey, 'track_id': trackId};

  Future<Response> getTrackListFromNetwork() async {
    Response response = await http
        .get(Uri.https(kBaseUrl, paths['trackList']!, trackListQueryParam));
    return response;
  }

  Future<Response> getTrackDetailsFromNetwork(int trackId) async {
    Response response = await http.get(Uri.https(
        kBaseUrl,
        paths['trackDetails']!,
        getTrackDetailsAndLyricsQueryParam(trackId.toString())));
    return response;
  }

  Future<Response> getTrackLyricsFromNetwork(int trackId) async {
    Response response = await http.get(Uri.https(
        kBaseUrl,
        paths['trackLyrics']!,
        getTrackDetailsAndLyricsQueryParam(trackId.toString())));
    return response;
  }
}
