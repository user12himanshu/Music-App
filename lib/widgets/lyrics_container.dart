import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_credicxo/widgets/error_widget.dart';
import 'package:music_app_credicxo/widgets/glass_containers/lyrics_glass_container.dart';
import 'package:music_app_credicxo/widgets/property_heading.dart';
import 'package:music_app_credicxo/widgets/property_text.dart';

import '../bloc/events/track_lyrics_events.dart';
import '../bloc/states/track_lyrics_state.dart';
import '../bloc/track_lyrics_bloc.dart';
import '../repository/track_lyrics_repository.dart';

class LyricsContainer extends StatelessWidget {
  final int trackId;

  const LyricsContainer({Key? key, required this.trackId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TrackLyricsRepository(),
      child: BlocProvider(
        create: (context) => TrackLyricsBloc(
            RepositoryProvider.of<TrackLyricsRepository>(context), trackId)
          ..add(
            TrackLyricsLoadEvent(),
          ),
        child: BlocBuilder<TrackLyricsBloc, TrackLyricsState>(
            builder: (context, state) {
          if (state is TrackLyricsErrorState) {
            return const ErrorTextWidget();
          } else if (state is TrackLyricsLoadedState) {
            return Builder(builder: (context) {
              var trackLyrics = state.model.message!.body!.lyrics!;
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: LyricsGlassContainer(
                  child: Column(
                    children: [
                      PropertyHeading(
                        heading: "Lyrics",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PropertyText(text: trackLyrics.lyricsBody!),
                      )
                    ],
                  ),
                ),
              );
            });
          }
          return const CircularProgressIndicator();
        }),
      ),
    );
  }
}
