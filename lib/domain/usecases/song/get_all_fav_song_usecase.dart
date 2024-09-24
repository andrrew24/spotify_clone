import 'package:dartz/dartz.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/repos/song/song_repo.dart';

class GetAllFavSongUsecase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? userId}) async {
    return await serviceLocator<SongRepo>().getAllFavSongs(userId!);
  }
}
