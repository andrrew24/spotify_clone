import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/repos/song/song_repo.dart';

class GetNewSongsUseCase implements Usecase<Either, dynamic> {
  final SongRepo songRepo;

  GetNewSongsUseCase({required this.songRepo});
  @override
  Future<Either> call({params}) async {
    return await songRepo.getNewSongs();
  }
}
