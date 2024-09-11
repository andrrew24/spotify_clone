import 'package:dartz/dartz.dart';

abstract class GetPlaylistRepo {
  Future<Either> getPlayList();
}
