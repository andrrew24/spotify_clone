import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/failure.dart';
import 'package:spotify_clone/data/sources/song/song_remote_data_source.dart';
import 'package:spotify_clone/domain/repos/song/get_new_song_repo.dart';
import 'package:spotify_clone/domain/repos/song/get_playlist_repo.dart';

class GetNewSongRepoImpl extends GetNewSongRepo {
  final GetNewSongRemoteDataSource _getNewSongRemoteDataSource;

  GetNewSongRepoImpl({required GetNewSongRemoteDataSource getNewSongRemoteDataSource}) : _getNewSongRemoteDataSource = getNewSongRemoteDataSource;
  @override
  Future<Either> getNewSongs() async {
    return await _getNewSongRemoteDataSource.fetchNewSongs();
  }
}

class GetPlaylistRepoImpl extends GetPlaylistRepo {
  final GetPlaylistRemoteDataSource _getPlaylistRemoteDataSource;

  GetPlaylistRepoImpl({required GetPlaylistRemoteDataSource getPlaylistRemoteDataSource}) : _getPlaylistRemoteDataSource = getPlaylistRemoteDataSource;
  @override
  Future<Either> getPlayList() async {
    return await _getPlaylistRemoteDataSource.getPlaylist();
  }
}
