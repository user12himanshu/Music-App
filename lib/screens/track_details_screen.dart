import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_credicxo/app_theme.dart';
import 'package:music_app_credicxo/main.dart';
import 'package:music_app_credicxo/models/track_details.dart';
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
          appBar: AppBar(
            backgroundColor: AppTheme.scaffoldBackgroundColor,
            elevation: 0,
            title: Text('Track Details'),
          ),
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
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Column(
                                    children: [
                                      const PropertyHeading(
                                          heading: 'Track Name'),
                                      PropertyText(
                                        text: trackDetails.trackName!,
                                      ),
                                      const PropertyHeading(
                                          heading: 'Artist Name'),
                                      PropertyText(
                                        text: trackDetails.artistName!,
                                      ),
                                      const PropertyHeading(
                                          heading: 'Album Name'),
                                      PropertyText(
                                        text: trackDetails.albumName!,
                                      ),
                                      const PropertyHeading(
                                          heading: 'Explicit'),
                                      PropertyText(
                                        text: trackDetails.explicit == 1
                                            ? 'True'
                                            : 'False',
                                      ),
                                      const PropertyHeading(heading: 'Rating'),
                                      PropertyText(
                                        text:
                                            trackDetails.trackRating.toString(),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: BookmarkIcon(
                                          trackDetails: trackDetails),
                                    ),
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

class BookmarkIcon extends StatefulWidget {
  final Track trackDetails;

  const BookmarkIcon({Key? key, required this.trackDetails}) : super(key: key);

  @override
  State<BookmarkIcon> createState() => _BookmarkIconState();
}

class _BookmarkIconState extends State<BookmarkIcon> {
  late bool isTrackExist;

  @override
  void initState() {
    isTrackExist = localStorage.isTrackExist(widget.trackDetails.trackId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isTrackExist) {
          setState(() {
            localStorage.putDetailsTrackInDb(widget.trackDetails);
            isTrackExist = true;
          });
        }
      },
      child: CircleAvatar(
        radius: 25,
        backgroundColor: AppTheme.secondryColor,
        child: Icon(
          isTrackExist ? Icons.bookmark_add : Icons.bookmark_add_outlined,
          color: Colors.white,
          size: 27,
        ),
      ),
    );
  }
}
