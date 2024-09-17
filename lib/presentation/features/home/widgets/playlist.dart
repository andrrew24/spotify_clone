import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/common/helper/is_dark_mode.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/core/constants/const.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';
import 'package:spotify_clone/domain/usecases/song/get_playlist_use_case.dart';
import 'package:spotify_clone/presentation/features/home/manager/_get_playlist_cubit/get_play_list_cubit.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetPlayListCubit(serviceLocator<GetPlaylistUseCase>())
            ..fetchPlaylist(),
      child: BlocBuilder<GetPlayListCubit, GetPlayListState>(
        builder: (context, state) {
          if (state is GetPlayListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetPlayListSuccess) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Playlist",
                      style: AppStyles.styleMedium20(),
                    ),
                    Text(
                      "See More",
                      style: AppStyles.styleRegular12(),
                    ),
                  ],
                ),
                const Gap(40),
                _songs(state.songs)
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            GoRouter.of(context).push(kPlaySongPage, extra: songs[index]);
          },
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isLightMode(context)
                    ? AppColors.lightGrey
                    : AppColors.darkGrey),
            child: const Icon(Icons.play_arrow_rounded),
          ),
          title: Text(
            songs[index].title,
            style: AppStyles.styleBold16(),
          ),
          subtitle: Text(
            songs[index].artist,
            style: AppStyles.styleRegular12(),
          ),
          trailing: SizedBox(
            width: 90,
            child: Row(
              children: [
                Text(
                  songs[index].duration.toStringAsFixed(2).replaceAll('.', ':'),
                  style: AppStyles.styleRegular15(),
                ),
                const Gap(5),
                IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: AppColors.darkGrey,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Gap(10),
      itemCount: songs.length,
    );
  }
}
