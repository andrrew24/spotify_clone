import 'package:spotify_clone/domain/entities/song_entity.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  DateTime? releaseDate;

  SongModel(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.releaseDate});

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
        title: title!,
        artist: artist!,
        duration: duration!,
        releaseDate: releaseDate!);
  }
}