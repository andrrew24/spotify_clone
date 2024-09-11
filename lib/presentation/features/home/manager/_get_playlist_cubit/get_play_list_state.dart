part of 'get_play_list_cubit.dart';

@immutable
sealed class GetPlayListState {}

final class GetPlayListInitial extends GetPlayListState {}

final class GetPlayListSuccess extends GetPlayListState {
  final List<SongEntity> songs;

  GetPlayListSuccess({required this.songs});
}

final class GetPlayListFailure extends GetPlayListState {
  final String errorMessage;

  GetPlayListFailure({required this.errorMessage});
}

final class GetPlayListLoading extends GetPlayListState {}
