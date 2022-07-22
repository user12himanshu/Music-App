import 'package:flutter/material.dart';
import 'package:music_app_credicxo/app_theme.dart';
import 'package:music_app_credicxo/widgets/music_card_container.dart';

import '../main.dart';
import '../models/local_storage_models.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({Key? key}) : super(key: key);

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  late List<LocalTrackDetails> localTrackList;

  @override
  void initState() {
    localTrackList = localStorage.getAlltrackList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.scaffoldBackgroundColor,
          elevation: 0,
          title: Text('Downloaded'),
        ),
        body: ListView.builder(
            itemCount: localTrackList.length,
            itemBuilder: (context, index) {
              LocalTrackDetails trackDetails = localTrackList[index];
              return MusicCardContainer(
                albumName: trackDetails.albumName,
                genre: trackDetails.genre,
                lyricsAvailable: trackDetails.hasLyrics ? 1 : 0,
                trackName: trackDetails.trackName,
                rating: trackDetails.rating,
                trackId: trackDetails.trackId,
                artistName: trackDetails.artistName,
              );
            }),
      ),
    );
  }
}
