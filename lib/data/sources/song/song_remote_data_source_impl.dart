import 'package:dartz/dartz.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/data/models/songs/song.dart';
import 'package:spotify_clone/data/sources/song/song_remote_data_source.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/token/token_manager.dart';

class SongRemoteDataSourceImpl extends SongRemoteDataSource {
  final PocketBase pb;

  SongRemoteDataSourceImpl({required this.pb});

  @override
  Future<Either> fetchNewSongs() async {
    try {
      List<SongEntity> songs = [];
      final body = await pb.collection('songs').getList(
        sort: '-created',
        page: 1,
        perPage: 3,
        headers: {
          'Authorization': 'Bearer ${getUserToken()}',
        },
      );

      for (var record in body.items) {
        var songModel = SongModel.fromJson(record.data, record.id);

        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } on ClientException catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either> getPlaylist() async {
    try {
      List<SongEntity> songs = [];
      final body = await pb.collection('songs').getFullList(
        headers: {
          'Authorization': 'Bearer ${getUserToken()}',
        },
      );

      for (var record in body) {
        var songModel = SongModel.fromJson(record.data, record.id);

        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } on ClientException catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String userId, String songId) async {
    try {
      final userRecord = await pb.collection('users').getOne(userId);
      List<dynamic> favoriteSongs = userRecord.data['favorite_songs'] ?? [];

      if (favoriteSongs.contains(songId)) {
        favoriteSongs.remove(songId);
      } else {
        favoriteSongs.add(songId);
      }

      await pb.collection('users').update(userId, body: {
        'favorite_songs': favoriteSongs,
      });
      return const Right("Fav Songs Updated Succefully");
    } on ClientException catch (e) {
      return Left("Fav Songs Update Failed :${e.toString()}");
    }
  }

  @override
  Future<Either> getAllFavSongs(String userId) async {
    try {
      final userRecord = await pb.collection('users').getOne(userId);
      List<dynamic> favoriteSongs = userRecord.data['favorite_songs'] ?? [];

      return Right(favoriteSongs);
    } on ClientException catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<dynamic, bool>> isFavoriteSong(
      String userId, String songId) async {
    try {
      final userRecord = await pb.collection('users').getOne(userId);
      List<dynamic> favoriteSongs = userRecord.data['favorite_songs'] ?? [];

      bool isFavorite = favoriteSongs.contains(songId);
      return Right(isFavorite);
    } on ClientException catch (e) {
      return Left("isFavoriteSong Fail:${e.toString()}");
    }
  }
}
