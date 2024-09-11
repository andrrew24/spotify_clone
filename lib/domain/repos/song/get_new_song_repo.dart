import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/errors/failure.dart';

abstract class GetNewSongRepo {
  Future<Either> getNewSongs();
}
