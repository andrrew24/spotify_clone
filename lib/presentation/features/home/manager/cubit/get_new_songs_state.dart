part of 'get_new_songs_cubit.dart';

@immutable
sealed class GetNewSongsState {}

final class GetNewSongsInitial extends GetNewSongsState {}

final class GetNewSongsLoading extends GetNewSongsState {}

final class GetNewSongsSuccess extends GetNewSongsState {
  final List<SongEntity> songs;

  GetNewSongsSuccess({required this.songs});
}

final class GetNewSongsFailure extends GetNewSongsState {
  final String errorMessage;

  GetNewSongsFailure({required this.errorMessage});
}
