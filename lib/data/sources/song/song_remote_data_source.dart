import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/data/models/songs/song.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';
import 'package:spotify_clone/presentation/features/authentication/manager/token/token_manager.dart';

abstract class GetNewSongRemoteDataSource {
  Future<Either> fetchNewSongs();
}

class GetNewSongRemoteDataSourceImpl extends GetNewSongRemoteDataSource {
  final PocketBase pb;

  GetNewSongRemoteDataSourceImpl({required this.pb});
  @override
  Future<Either> fetchNewSongs() async {
    try {
      List<SongEntity> songs = [];
      final body = await pb.collection('songs').getList(
        sort: '-created',
        page: 1,
        perPage: 3,
        headers: {
          'Authorization': 'Bearer ${getUserToken()}',
        },
      );

      for (var record in body.items) {
        var songModel = SongModel.fromJson(record.data, record.id);

        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } on ClientException catch (e) {
      return left(e.toString());
    }
  }
}

abstract class GetPlaylistRemoteDataSource {
  Future<Either> getPlaylist();
}

class GetPlaylistRemoteDataSourceImpl implements GetPlaylistRemoteDataSource {
  final PocketBase pb;

  GetPlaylistRemoteDataSourceImpl({required this.pb});
  @override
  Future<Either> getPlaylist() async {
    try {
      List<SongEntity> songs = [];
      final body = await pb.collection('songs').getFullList(
        headers: {
          'Authorization': 'Bearer ${getUserToken()}',
        },
      );

      for (var record in body) {
        var songModel = SongModel.fromJson(record.data, record.id);

        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } on ClientException catch (e) {
      return left(e.toString());
    }
  }
}
