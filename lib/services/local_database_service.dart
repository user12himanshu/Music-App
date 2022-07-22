import 'package:music_app_credicxo/models/track_details.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../models/local_storage_models.dart';
import '../objectbox.g.dart';

class LocalStorage {
  late Store store;
  late Box<LocalTrackDetails> localTrackBox;

  Future getObjectStore() async {
    await getApplicationDocumentsDirectory().then((dir) {
      store =
          Store(getObjectBoxModel(), directory: join(dir.path, 'local_tracks'));
      localTrackBox = store.box<LocalTrackDetails>();
    });
    print('store created');
  }

  void openObjectbox() {
    store = openStore();
    print('store opened');
  }

  void putDetailsTrackInDb(Track track) {
    LocalTrackDetails localTrackDetails = LocalTrackDetails(
        trackId: track.trackId!,
        rating: track.trackRating!,
        albumName: track.albumName!,
        trackName: track.trackName!,
        lyricsBody: '',
        genre: track
            .primaryGenres!.musicGenreList!.first.musicGenre!.musicGenreName!,
        hasLyrics: track.hasLyrics == 1 ? true : false,
        isExplicit: track.explicit == 1 ? true : false,
        artistName: track.artistName!);
    localTrackBox.put(localTrackDetails);
  }

  List<LocalTrackDetails> getAlltrackList() => localTrackBox.getAll();

  bool isTrackExist(int trackId) {
    return localTrackBox
        .query(LocalTrackDetails_.trackId.equals(trackId))
        .build()
        .find()
        .isNotEmpty;
  }
}
