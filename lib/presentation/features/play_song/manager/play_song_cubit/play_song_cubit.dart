import 'dart:developer';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';

part 'play_song_state.dart';

class PlaySongCubit extends Cubit<PlaySongState> {
  final AudioPlayer audioPlayer = AudioPlayer();

  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  PlaySongCubit() : super(PlaySongLoading()) {
    audioPlayer.positionStream.listen(
      (position) {
        songPosition = position;
        updateSongPlayer();
      },
    );

    audioPlayer.durationStream.listen(
      (duration) {
        songDuration = duration!;
      },
    );
  }

  void updateSongPlayer() {
    emit(PlaySongSuccess());
  }

  Future<void> loadSong(String url) async {
    try {
      log(url);
      await audioPlayer.setUrl(url);
      emit(PlaySongSuccess());
    } catch (e) {
      emit(PlaySongFailure(errorMessage: e.toString()));
    }
  }

  void playOrPauseSong() {
    if (audioPlayer.playing) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }

    emit(PlaySongSuccess());
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
