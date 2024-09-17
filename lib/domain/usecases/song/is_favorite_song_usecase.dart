import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/usecase/usecase_2_param.dart';
import 'package:spotify_clone/domain/repos/song/song_repo.dart';

class IsFavoriteSongUsecase extends Usecase2Param {
  @override
  Future call({params1, params2})async {
    return await serviceLocator<SongRepo>().isFavoriteSong(params1, params2);
  }
}