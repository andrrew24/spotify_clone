import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify_clone/core/errors/failure.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';
import 'package:spotify_clone/domain/repos/song/song_repo.dart';
import 'package:spotify_clone/domain/usecases/song/song_usecase.dart';

part 'get_new_songs_state.dart';

class GetNewSongsCubit extends Cubit<GetNewSongsState> {
  final GetNewSongsUseCase getNewSongsUseCase;

  GetNewSongsCubit(this.getNewSongsUseCase) : super(GetNewSongsInitial());

  Future<void> getNewSongs() async {
    emit(GetNewSongsLoading());
    log("get new songs TRIGGERED");
    var returnedSongs = await getNewSongsUseCase.call();
    returnedSongs.fold(
      (l) {
        emit(GetNewSongsFailure(errorMessage: l));
        log("get new songs failed");
      },
      (r) {
        emit(GetNewSongsSuccess(songs: r));
        log("get new songs success");
      },
    );
  }
}
