import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/common/helper/format_duration.dart';
import 'package:spotify_clone/core/config/app_urls.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/core/widgets/basic_appbar.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';
import 'package:spotify_clone/presentation/features/play_song/manager/play_song_cubit/play_song_cubit.dart';

class PlaySongPage extends StatelessWidget {
  const PlaySongPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = GoRouterState.of(context);
    final song = state.extra as SongEntity;
    return Scaffold(
      appBar: BasicAppBar(
        leadingonPressed: () {
          GoRouter.of(context).pop();
        },
        hasBG: true,
        leadinIcon: Icons.arrow_back_ios_new_rounded,
        title: Text(
          "Now Playing",
          style: AppStyles.styleBold18(),
        ),
        trailingIcon: FontAwesomeIcons.ellipsisVertical,
        trailingonPressed: () {},
      ),
      body: BlocProvider(
        create: (context) => PlaySongCubit()
          ..loadSong(
            "${AppUrls.appApi}${song.id}/${song.songLink}",
            // "http://10.0.2.2:8090/api/files/2tw7h5a5q8bjqyj/3shktlx8jeacjzq/the_weeknd_save_your_tears_remix_1xpxknBNlQ.mp3?token="
          )
          ..playOrPauseSong(),
        child: SingleChildScrollView(
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
                              "${AppUrls.appApi}${song.id}/${song.coverLink}"))),
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          song.title,
                          style: AppStyles.styleBold20(),
                        ),
                        Text(
                          song.artist,
                          style: AppStyles.styleRegular17(),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite_outline_outlined),
                      onPressed: () {},
                      color: AppColors.darkGrey,
                    )
                  ],
                ),
                Gap(20),
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
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is PlaySongFailure) {
          return Text(state.errorMessage);
        }
        if (state is PlaySongSuccess) {
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
              Gap(20),
              GestureDetector(
                onTap: () {
                  context.read<PlaySongCubit>().playOrPauseSong();
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
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
