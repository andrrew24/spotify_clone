part of 'add_remove_fav_song_cubit.dart';

@immutable
sealed class AddRemoveFavSongState {}

final class AddRemoveFavSongInitial extends AddRemoveFavSongState {}

final class AddRemoveFavSongUpdated extends AddRemoveFavSongState {
  final bool isFavorite;

  AddRemoveFavSongUpdated({required this.isFavorite});
}
