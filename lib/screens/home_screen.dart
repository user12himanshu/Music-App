import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_credicxo/app_theme.dart';
import 'package:music_app_credicxo/screens/bookmark_page.dart';

import '../bloc/events/track_list_event.dart';
import '../bloc/states/track_list_state.dart';
import '../bloc/track_list_bloc.dart';
import '../repository/track_list_repository.dart';
import '../widgets/error_widget.dart';
import '../widgets/music_card_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrackListBloc>(
      create: (context) =>
          TrackListBloc(RepositoryProvider.of<TrackListRepository>(context))
            ..add(TrackListLoadEvent()),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppTheme.scaffoldBackgroundColor,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return BookMarkPage();
                    }));
                  },
                  icon: Icon(Icons.bookmark))
            ],
            title: Text(
              'Trending',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.white.withOpacity(0.9)),
            ),
          ),
          body: BlocBuilder<TrackListBloc, TrackListState>(
            builder: (ctx, state) {
              if (state is TrackListErrorState) {
                return const ErrorTextWidget();
              } else if (state is TrackListLoadedState) {
                return Builder(builder: (context) {
                  var trackList = state.model.message!.body!.trackList!;
                  return ListView.builder(
                    itemCount: trackList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var track = trackList[index].track!;
                      return index != 1
                          ? MusicCardContainer(
                              albumName: track.albumName!,
                              genre: track.primaryGenres!.musicGenreList!.first
                                  .musicGenre!.musicGenreName!,
                              lyricsAvailable: track.hasLyrics!,
                              trackName: track.trackName!,
                              rating: track.trackRating!,
                              trackId: track.trackId!,
                              artistName: track.artistName!,
                            )
                          : Container();
                    },
                  );
                });
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
