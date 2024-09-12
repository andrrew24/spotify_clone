class SongEntity {
  final String id;
  final String title;
  final String artist;
  final String coverLink;
  final String songLink;
  final num duration;
  final DateTime releaseDate;

  SongEntity(
      {
      required this.songLink,  
      required this.title,
      required this.id,
      required this.coverLink,
      required this.artist,
      required this.duration,
      required this.releaseDate});
}
