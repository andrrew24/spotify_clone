import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/repos/song/get_new_song_repo.dart';

class GetNewSongsUseCase implements Usecase<Either, dynamic> {
  final GetNewSongRepo getNewSongRepo;

  GetNewSongsUseCase({required this.getNewSongRepo});
  @override
  Future<Either> call({params}) async {
    return await getNewSongRepo.getNewSongs();
  }
}
