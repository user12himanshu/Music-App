import 'package:objectbox/objectbox.dart';

@Entity()
class LocalTrackDetails {
  @Id(assignable: true)
  int trackId;
  int rating;
  String trackName;
  String albumName;
  String artistName;
  String genre;
  String lyricsBody;
  bool hasLyrics;
  bool isExplicit;

  LocalTrackDetails(
      {required this.trackId,
      required this.rating,
      required this.albumName,
      required this.trackName,
      required this.lyricsBody,
      required this.genre,
      required this.hasLyrics,
      required this.isExplicit,
      required this.artistName});
}
