import 'package:dartz/dartz.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/core/usecase/usecase_2_param.dart';
import 'package:spotify_clone/domain/repos/song/song_repo.dart';

class AddOrRemoveFavSongUsecase extends Usecase2Param<Either,String>{
  @override
  Future<Either> call({String? userId, String? songId}) async {
    return serviceLocator<SongRepo>().addOrRemoveFavSong(userId!, songId!);
  }
}
