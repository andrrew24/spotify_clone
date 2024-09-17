import 'package:dartz/dartz.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/core/usecase/usecase_2_param.dart';
import 'package:spotify_clone/domain/repos/song/song_repo.dart';

class AddOrRemoveFavSongUsecase extends Usecase2Param<Either, String> {
  @override
  Future<Either> call({String? params1, String? params2}) async {
    return serviceLocator<SongRepo>().addOrRemoveFavSong(params1!, params2!);
  }
}
