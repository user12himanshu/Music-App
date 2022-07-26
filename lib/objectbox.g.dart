// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'models/local_storage_models.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 1675177939729441810),
      name: 'LocalTrackDetails',
      lastPropertyId: const IdUid(9, 5049388562049476591),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2314782481788321869),
            name: 'trackId',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 342032649410917979),
            name: 'rating',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1287231093873827632),
            name: 'trackName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4287342298175005405),
            name: 'albumName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8846637097454935560),
            name: 'artistName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 7544461185842825843),
            name: 'genre',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 5857607153863145699),
            name: 'lyricsBody',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 974325663200064241),
            name: 'hasLyrics',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 5049388562049476591),
            name: 'isExplicit',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Store openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) =>
    Store(getObjectBoxModel(),
        directory: directory,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 1675177939729441810),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    LocalTrackDetails: EntityDefinition<LocalTrackDetails>(
        model: _entities[0],
        toOneRelations: (LocalTrackDetails object) => [],
        toManyRelations: (LocalTrackDetails object) => {},
        getId: (LocalTrackDetails object) => object.trackId,
        setId: (LocalTrackDetails object, int id) {
          object.trackId = id;
        },
        objectToFB: (LocalTrackDetails object, fb.Builder fbb) {
          final trackNameOffset = fbb.writeString(object.trackName);
          final albumNameOffset = fbb.writeString(object.albumName);
          final artistNameOffset = fbb.writeString(object.artistName);
          final genreOffset = fbb.writeString(object.genre);
          final lyricsBodyOffset = fbb.writeString(object.lyricsBody);
          fbb.startTable(10);
          fbb.addInt64(0, object.trackId);
          fbb.addInt64(1, object.rating);
          fbb.addOffset(2, trackNameOffset);
          fbb.addOffset(3, albumNameOffset);
          fbb.addOffset(4, artistNameOffset);
          fbb.addOffset(5, genreOffset);
          fbb.addOffset(6, lyricsBodyOffset);
          fbb.addBool(7, object.hasLyrics);
          fbb.addBool(8, object.isExplicit);
          fbb.finish(fbb.endTable());
          return object.trackId;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = LocalTrackDetails(
              trackId:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              rating:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0),
              albumName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              trackName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              lyricsBody: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 16, ''),
              genre: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, ''),
              hasLyrics: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 18, false),
              isExplicit: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 20, false),
              artistName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [LocalTrackDetails] entity fields to define ObjectBox queries.
class LocalTrackDetails_ {
  /// see [LocalTrackDetails.trackId]
  static final trackId =
      QueryIntegerProperty<LocalTrackDetails>(_entities[0].properties[0]);

  /// see [LocalTrackDetails.rating]
  static final rating =
      QueryIntegerProperty<LocalTrackDetails>(_entities[0].properties[1]);

  /// see [LocalTrackDetails.trackName]
  static final trackName =
      QueryStringProperty<LocalTrackDetails>(_entities[0].properties[2]);

  /// see [LocalTrackDetails.albumName]
  static final albumName =
      QueryStringProperty<LocalTrackDetails>(_entities[0].properties[3]);

  /// see [LocalTrackDetails.artistName]
  static final artistName =
      QueryStringProperty<LocalTrackDetails>(_entities[0].properties[4]);

  /// see [LocalTrackDetails.genre]
  static final genre =
      QueryStringProperty<LocalTrackDetails>(_entities[0].properties[5]);

  /// see [LocalTrackDetails.lyricsBody]
  static final lyricsBody =
      QueryStringProperty<LocalTrackDetails>(_entities[0].properties[6]);

  /// see [LocalTrackDetails.hasLyrics]
  static final hasLyrics =
      QueryBooleanProperty<LocalTrackDetails>(_entities[0].properties[7]);

  /// see [LocalTrackDetails.isExplicit]
  static final isExplicit =
      QueryBooleanProperty<LocalTrackDetails>(_entities[0].properties[8]);
}
