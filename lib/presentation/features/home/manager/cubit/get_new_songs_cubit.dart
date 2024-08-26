import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify_clone/core/errors/failure.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';

part 'get_new_songs_state.dart';

class GetNewSongsCubit extends Cubit<GetNewSongsState> {
  GetNewSongsCubit() : super(GetNewSongsInitial());
}
