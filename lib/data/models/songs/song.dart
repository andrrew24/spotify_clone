import 'package:spotify_clone/common/functions/date_time_converter.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';

class SongModel {
  String id;
  String? collectionId;
  String? collectionName;
  String? created;
  String? updated;
  String? title;
  String? cover;
  String? song;
  String? artist;
  bool? isFavorite;
  DateTime? releaseDate;
  num? duration;

  SongModel({
    required this.id,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.title,
    this.cover,
    this.song,
    this.artist,
    this.releaseDate,
    this.isFavorite,
    this.duration,
  });

  factory SongModel.fromJson(
    Map<String, dynamic> json,
    String songId,
    bool isFavorite,
  ) =>
      SongModel(
        id: songId,
        isFavorite: isFavorite,
        collectionId: json['collectionId'] as String?,
        collectionName: json['collectionName'] as String?,
        created: json['created'] as String?,
        updated: json['updated'] as String?,
        title: json['title'] as String?,
        cover: json['cover'] as String?,
        song: json['song'] as String?,
        artist: json['artist'] as String?,
        releaseDate: timeStamptoDateTimeConverter(json['releaseDate']),
        duration: json['duration'] as num?,
      );
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
        coverLink: cover!,
        isFavorite: isFavorite!,
        songLink: song!,
        title: title!,
        id: id,
        artist: artist!,
        duration: duration!,
        releaseDate: releaseDate!);
  }
}
