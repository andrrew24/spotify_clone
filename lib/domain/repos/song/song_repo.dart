import 'package:dartz/dartz.dart';

abstract class SongRepo {
  Future<Either> getPlayList();
  Future<Either> getNewSongs();
  Future<Either> addOrRemoveFavSong(String userId, String songId);
  Future<Either> getAllFavSongs(String userId);
  Future<bool> isFavoriteSong(String userId,String songId);
}
