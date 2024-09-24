import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/data/models/songs/song.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';

abstract class SongRemoteDataSource {
  Future<Either> fetchNewSongs();
  Future<Either> getPlaylist();
  Future<Either> addOrRemoveFavoriteSongs(String userId, String songId);
  Future<Either> getAllFavSongs(String userId);
  Future<bool> isFavoriteSong(String userId, String songId);
}
