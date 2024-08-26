import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/failure.dart';
import 'package:spotify_clone/data/sources/song/song_remote_data_source.dart';
import 'package:spotify_clone/domain/repos/song/song_repo.dart';

class SongRepoImpl extends SongRepo {
  final SongRemoteDataSource songRemoteDataSource;

  SongRepoImpl({required this.songRemoteDataSource});
  @override
  Future<Either> getNewSongs()async {
    return await songRemoteDataSource.fetchNewSongs();
  }
}
