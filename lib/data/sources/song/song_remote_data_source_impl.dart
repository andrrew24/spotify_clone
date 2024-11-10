import 'package:dartz/dartz.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/data/models/songs/song.dart';
import 'package:spotify_clone/data/sources/song/song_remote_data_source.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';

class SongRemoteDataSourceImpl extends SongRemoteDataSource {
  SongRemoteDataSourceImpl();

  @override
  Future<Either> fetchNewSongs() async {
    try {
      List<SongEntity> songs = [];
      final body = await pb.collection('songs').getList(
        sort: '-created',
        page: 1,
        perPage: 5,
        headers: {
          'Authorization': 'Bearer ${pb.authStore.token}',
        },
      );

      for (var record in body.items) {
        bool isFavorite =
            await isFavoriteSong(pb.authStore.model.id, record.id);
        var songModel = SongModel.fromJson(record.data, record.id, isFavorite);
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
          'Authorization': 'Bearer ${pb.authStore.token}',
        },
      );

      for (var record in body) {
        bool isFavorite =
            await isFavoriteSong(pb.authStore.model.id, record.id);
        var songModel = SongModel.fromJson(record.data, record.id, isFavorite);
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } on ClientException catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String userId, String songId) async {
    bool isFavorite = false;
    try {
      final userRecord = await pb.collection('users').getOne(userId);
      List<dynamic> favoriteSongs = userRecord.data['favorite_songs'] ?? [];

      if (favoriteSongs.contains(songId)) {
        favoriteSongs.remove(songId);
      } else {
        favoriteSongs.add(songId);
        isFavorite = true;
      }

      await pb.collection('users').update(userId, body: {
        'favorite_songs': favoriteSongs,
      });
      return  Right(isFavorite);
    } on ClientException {
      return const Left(false);
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
  Future<bool> isFavoriteSong(String userId, String songId) async {
    try {
      final userRecord = await pb.collection('users').getOne(userId);
      List<dynamic> favoriteSongs = userRecord.data['favorite_songs'] ?? [];

      bool isFavorite = favoriteSongs.contains(songId);
      return isFavorite;
    } on ClientException {
      return false;
    }
  }
}
