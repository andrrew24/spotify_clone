import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/common/helper/is_dark_mode.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_song_usecase.dart';
import 'package:spotify_clone/presentation/features/home/manager/get_new_songs_cubit/get_new_songs_cubit.dart';
import 'package:spotify_clone/core/config/constants/app_const.dart';

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
              return const Center(child: CircularProgressIndicator());
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
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppConstants.kPlaySongPage, extra: songs[index]);
            },
            child: SizedBox(
              width: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "$appApi${songs[index].id}/${songs[index].coverLink}",
                          ),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          transform: Matrix4.translationValues(-5, 15, 0),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isLightMode(context)
                                  ? AppColors.lightGrey
                                  : AppColors.darkGrey),
                          child: const Icon(Icons.play_arrow_rounded),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Text(
                    songs[index].title,
                    style: AppStyles.styleBold16(),
                  ),
                  Text(
                    songs[index].artist,
                    style: AppStyles.styleMedium14(),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Gap(10),
        itemCount: songs.length);
  }
}
