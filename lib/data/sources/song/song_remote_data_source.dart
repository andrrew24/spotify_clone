import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/data/models/songs/song.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';

abstract class SongRemoteDataSource {
  Future<Either> fetchNewSongs();
}

class SongRemoteDataSourceImpl extends SongRemoteDataSource {
  final PocketBase pb;

  SongRemoteDataSourceImpl({required this.pb});
  @override
  Future<Either> fetchNewSongs() async {
    try {
      List<SongEntity> songs = [];
      final body = await pb.collection('songs').getList(
        sort: '-created',
       page: 1,
       perPage: 3
      );

      for (var record in body.items) {
        var songModel = SongModel.fromJson(record.data,record.id);

        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } on ClientException catch (e) {
      return left(e.toString());
    }
  }
}
