import 'package:dartz/dartz.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/repos/song/song_repo.dart';

class GetNewSongsUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({param}) async {
    return await serviceLocator<SongRepo>().getNewSongs();
  }
}
