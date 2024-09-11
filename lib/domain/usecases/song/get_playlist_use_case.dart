import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/repos/song/get_playlist_repo.dart';

class GetPlaylistUseCase implements Usecase<Either, dynamic> {
  final GetPlaylistRepo _getPlaylistRepo;

  GetPlaylistUseCase({required GetPlaylistRepo getPlaylistRepo})
      : _getPlaylistRepo = getPlaylistRepo;
  @override
  Future<Either> call({params}) async {
    return await _getPlaylistRepo.getPlayList();
  }
}
