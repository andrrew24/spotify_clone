import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/domain/usecases/song/add_or_remove_fav_song_usecase.dart';

part 'add_remove_fav_song_state.dart';

class AddRemoveFavSongCubit extends Cubit<AddRemoveFavSongState> {
  AddRemoveFavSongCubit() : super(AddRemoveFavSongInitial());

  void updateIsFavoriteSong(String userId, String songId) async {
    var result = await serviceLocator<AddOrRemoveFavSongUsecase>()
        .call(songId: songId, userId: userId);

    result.fold(
      (l) {},
      (isFavorite) {
        print(isFavorite);
        emit(
          AddRemoveFavSongUpdated(isFavorite: isFavorite),
        );
      },
    );
  }
}
