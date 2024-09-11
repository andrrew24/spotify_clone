import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'play_song_state.dart';

class PlaySongCubit extends Cubit<PlaySongState> {
  PlaySongCubit() : super(PlaySongInitial());
}
