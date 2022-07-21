import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../models/track_model.dart';
import '../screens/track_details_screen.dart';
import 'glass_containers/tile_glass_container.dart';

class MusicCardContainer extends StatelessWidget {
  const MusicCardContainer({
    Key? key,
    required this.track,
  }) : super(key: key);

  final Track track;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return TrackDetailsScreen(trackId: track.trackId!);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: TileGlassContainer(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Opacity(
                  opacity: 0.8,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/music_cp.jpg'),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        track.trackName!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      track.artistName!,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Container(
                      width: 150,
                      child: Text(
                        track.albumName!,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      track.primaryGenres!.musicGenreList![0].musicGenre!
                          .musicGenreName!,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: AppTheme.secondryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(height: 5),
                    Text(
                      track.hasLyrics == 1
                          ? 'Lyrics\nAvailable'
                          : 'Lyrics\nUnavailable',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${track.trackRating.toString()}/100",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
