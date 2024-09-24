import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';
import 'package:spotify_clone/presentation/features/home/manager/add_remove_fav_song_cubit/add_remove_fav_song_cubit.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.song});

  final SongEntity song;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddRemoveFavSongCubit(),
      child: BlocBuilder<AddRemoveFavSongCubit, AddRemoveFavSongState>(
        builder: (context, state) {
          if (state is AddRemoveFavSongInitial) {
            return IconButton(
              icon: Icon(
                song.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_outline_outlined,
                color: AppColors.darkGrey,
              ),
              onPressed: () {
                context
                    .read<AddRemoveFavSongCubit>()
                    .updateIsFavoriteSong(pb.authStore.model.id, song.id);
              },
            );
          }
          if (state is AddRemoveFavSongUpdated) {
            return IconButton(
              icon: Icon(
                state.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_outline_outlined,
                color: AppColors.darkGrey,
              ),
              onPressed: () {
                context
                    .read<AddRemoveFavSongCubit>()
                    .updateIsFavoriteSong(pb.authStore.model.id, song.id);
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
