import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/failure.dart';
import 'package:spotify_clone/data/sources/song/song_remote_data_source.dart';
import 'package:spotify_clone/domain/repos/song/song_repo.dart';

class SongRepoImpl extends SongRepo {
  final SongRemoteDataSource _songRemoteDataSource;

  SongRepoImpl({required SongRemoteDataSource songRemoteDataSource})
      : _songRemoteDataSource = songRemoteDataSource;

  @override
  Future<Either> addOrRemoveFavSong(String userId, String songId) async {
    return await _songRemoteDataSource.addOrRemoveFavoriteSongs(userId, songId);
  }

  @override
  Future<Either> getNewSongs() async {
    return await _songRemoteDataSource.fetchNewSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await _songRemoteDataSource.getPlaylist();
  }

  @override
  Future<Either> getAllFavSongs(String userId) async {
    return await _songRemoteDataSource.getAllFavSongs(userId);
  }

  @override
  Future<Either<dynamic,bool>> isFavoriteSong(String userId, String songId) async {
    return _songRemoteDataSource.isFavoriteSong(userId, songId);
  }
}
