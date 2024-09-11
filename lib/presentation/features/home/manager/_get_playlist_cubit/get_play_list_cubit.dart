import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';
import 'package:spotify_clone/domain/usecases/song/get_playlist_use_case.dart';

part 'get_play_list_state.dart';

class GetPlayListCubit extends Cubit<GetPlayListState> {
  final GetPlaylistUseCase _getPlaylistUseCase;
  GetPlayListCubit(this._getPlaylistUseCase) : super(GetPlayListLoading());

  Future<void> fetchPlaylist() async {
    emit(GetPlayListLoading());
    var returnedSongs = await _getPlaylistUseCase.call();

    returnedSongs.fold(
      (l) {
        emit(GetPlayListFailure(errorMessage: l));
      },
      (r) {
        emit(GetPlayListSuccess(songs: r));
      },
    );
  }
}
