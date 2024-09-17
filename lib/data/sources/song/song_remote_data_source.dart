import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/data/models/songs/song.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/token/token_manager.dart';

abstract class SongRemoteDataSource {
  Future<Either> fetchNewSongs();
  Future<Either> getPlaylist();
  Future<Either> addOrRemoveFavoriteSongs(String userId, String songId);
  Future<Either> getAllFavSongs(String userId);
  Future<Either<dynamic,bool>> isFavoriteSong(String userId, String songId);

}
