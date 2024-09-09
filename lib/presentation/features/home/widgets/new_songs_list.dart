import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';
import 'package:spotify_clone/domain/usecases/song/song_usecase.dart';
import 'package:spotify_clone/presentation/features/home/manager/cubit/get_new_songs_cubit.dart';

class NewSongsList extends StatelessWidget {
  const NewSongsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          GetNewSongsCubit(serviceLocator<GetNewSongsUseCase>())..getNewSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<GetNewSongsCubit, GetNewSongsState>(
          builder: (context, state) {
            if (state is GetNewSongsSuccess) {
              return _songs(state.songs);
            } else if (state is GetNewSongsLoading) {
              return const CircularProgressIndicator();
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 160,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Gap(10),
        itemCount: songs.length);
  }
}
