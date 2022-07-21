import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_credicxo/widgets/property_heading.dart';
import 'package:music_app_credicxo/widgets/property_text.dart';

import '../bloc/events/track_details_event.dart';
import '../bloc/states/track_details_state.dart';
import '../bloc/track_details_bloc.dart';
import '../repository/track_details_repository.dart';
import '../widgets/error_widget.dart';
import '../widgets/glass_containers/details_glass_container.dart';
import '../widgets/lyrics_container.dart';

class TrackDetailsScreen extends StatelessWidget {
  final int trackId;

  const TrackDetailsScreen({Key? key, required this.trackId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TrackDetailsRepository(),
      child: SafeArea(
        child: Scaffold(
          body: BlocProvider(
            create: (context) => TrackDetailsBloc(
                RepositoryProvider.of<TrackDetailsRepository>(context), trackId)
              ..add(
                TrackDetailsLoadEvent(),
              ),
            child: BlocBuilder<TrackDetailsBloc, TrackDetailsState>(
                builder: (context, state) {
              if (state is TrackDetailsErrorState) {
                return const ErrorTextWidget();
              } else if (state is TrackDetailsLoadedState) {
                return SingleChildScrollView(
                  child: Builder(builder: (context) {
                    var trackDetails = state.model.message!.body!.track!;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: DetailsGlassContainer(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const PropertyHeading(heading: 'Track Name'),
                                  PropertyText(
                                    text: trackDetails.trackName!,
                                  ),
                                  const PropertyHeading(heading: 'Artist Name'),
                                  PropertyText(
                                    text: trackDetails.artistName!,
                                  ),
                                  const PropertyHeading(heading: 'Album Name'),
                                  PropertyText(
                                    text: trackDetails.albumName!,
                                  ),
                                  const PropertyHeading(heading: 'Explicit'),
                                  PropertyText(
                                    text: trackDetails.explicit == 1
                                        ? 'True'
                                        : 'False',
                                  ),
                                  const PropertyHeading(heading: 'Rating'),
                                  PropertyText(
                                    text: trackDetails.trackRating.toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        LyricsContainer(trackId: trackId)
                      ],
                    );
                  }),
                );
              }
              return const Center(child: CircularProgressIndicator());
            }),
          ),
        ),
      ),
    );
  }
}
