import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/common/helper/format_duration.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/config/constants/app_const.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/common/widgets/app_bar/basic_appbar.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';
import 'package:spotify_clone/presentation/features/home/widgets/fav_button.dart';
import 'package:spotify_clone/presentation/features/play_song/manager/play_song_cubit/play_song_cubit.dart';

class PlaySongPage extends StatelessWidget {
  const PlaySongPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = GoRouterState.of(context);
    final song = state.extra as SongEntity;
    return BlocProvider(
      create: (context) => PlaySongCubit()
        ..loadSong(
          "$appApi${song.id}/${song.songLink}",
        )
        ,
      child: Scaffold(
        appBar: BasicAppBar(
          leadingonPressed: () {
            GoRouter.of(context).pushReplacement(AppConstants.kHomePage);
          },
          hasBG: true,
          leadinIcon: Icons.arrow_back_ios_new_rounded,
          title: Text(
            "Now Playing",
            style: AppStyles.styleBold18(),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "$appApi${song.id}/${song.coverLink}"))),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          song.title,
                          style: AppStyles.styleBold20(),
                        ),
                        Text(
                          song.artist,
                          textAlign: TextAlign.start,
                          style: AppStyles.styleRegular17(),
                        ),
                      ],
                    ),
                    FavButton(song: song)
                  ],
                ),
                const Gap(20),
                _songPlayer(song)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _songPlayer(SongEntity song) {
    return BlocBuilder<PlaySongCubit, PlaySongState>(
      builder: (context, state) {
        if (state is PlaySongLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is PlaySongFailure) {
          return Text(state.errorMessage);
        }
        if (state is PlayingSongSuccess) {
          return Column(
            children: [
              Slider(
                activeColor: AppColors.primaryColor,
                thumbColor: Colors.white,
                value: context
                    .read<PlaySongCubit>()
                    .songPosition
                    .inSeconds
                    .toDouble(),
                min: 0.0,
                max: context
                    .read<PlaySongCubit>()
                    .songDuration
                    .inSeconds
                    .toDouble(),
                onChanged: (value) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatDuration(context.read<PlaySongCubit>().songPosition),
                    style: AppStyles.styleRegular12(),
                  ),
                  Text(
                    formatDuration(context.read<PlaySongCubit>().songDuration),
                    style: AppStyles.styleRegular12(),
                  ),
                ],
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  context.read<PlaySongCubit>().playOrPauseSong();
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: Icon(context.read<PlaySongCubit>().audioPlayer.playing
                      ? FontAwesomeIcons.pause
                      : FontAwesomeIcons.play),
                ),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
