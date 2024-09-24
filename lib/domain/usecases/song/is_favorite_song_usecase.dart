import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/usecase/usecase_2_param.dart';
import 'package:spotify_clone/domain/repos/song/song_repo.dart';

class IsFavoriteSongUsecase extends Usecase2Param {
  @override
  Future call({userId, songId}) async {
    return await serviceLocator<SongRepo>().isFavoriteSong(userId, songId);
  }
}
