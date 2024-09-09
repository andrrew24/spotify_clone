import 'package:spotify_clone/common/functions/date_time_converter.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';

class Song {
  String? id;
  String? collectionId;
  String? collectionName;
  String? created;
  String? updated;
  String? title;
  String? cover;
  String? song;
  String? artist;
  DateTime? releaseDate;
  num? duration;

  Song({
    this.id,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.title,
    this.cover,
    this.song,
    this.artist,
    this.releaseDate,
    this.duration,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json['id'] as String?,
        collectionId: json['collectionId'] as String?,
        collectionName: json['collectionName'] as String?,
        created: json['created'] as String?,
        updated: json['updated'] as String?,
        title: json['title'] as String?,
        cover: json['cover'] as String?,
        song: json['song'] as String?,
        artist: json['artist'] as String?,
        releaseDate: timeStamptoDateTimeConverter(json['releaseDate']) ,
        duration: json['duration'] as num?,
      );
}

extension SongModelX on Song {
  SongEntity toEntity() {
    return SongEntity(
        title: title!,
        artist: artist!,
        duration: duration!,
        releaseDate: releaseDate!);
  }
}
