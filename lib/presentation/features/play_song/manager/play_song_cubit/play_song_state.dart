part of 'play_song_cubit.dart';

@immutable
sealed class PlaySongState {}

final class PlayingSongSuccess extends PlaySongState {}

final class PlaySongFailure extends PlaySongState {
  final String errorMessage;

  PlaySongFailure({required this.errorMessage});
}

final class PlaySongLoading extends PlaySongState {}
