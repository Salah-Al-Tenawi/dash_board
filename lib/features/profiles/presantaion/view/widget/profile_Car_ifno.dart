import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecars/core/constant/imagesUrl.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/them/text_app.dart';
import 'package:sharecars/features/profiles/data/model/enum/profile_mode.dart';
import 'package:sharecars/core/utils/functions/show_image.dart';
import 'package:sharecars/core/utils/widgets/cutom_list_tile.dart';
import 'package:sharecars/core/utils/widgets/my_button.dart';
import 'package:sharecars/features/profiles/domain/entity/car_entity.dart';
import 'package:sharecars/features/profiles/presantaion/manger/profile_cubit/profile_cubit.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_edit_info_car.dart';

class ProfileCarIfno extends StatelessWidget {
  final CarEntity car;
  const ProfileCarIfno({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileloadedState) {
          switch (state.mode) {
            case ProfileMode.otherView:
            case ProfileMode.myView:
              Column(
                children: [
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: MyButton(
                          onPressed: () {
                            car.image != null
                                ? openImage(car.image!)
                                : openImage(ImagesUrl.defualtCar);
                          },
                          child: CircleAvatar(
                            backgroundColor: MyColors.newrskey,
                            maxRadius: 30,
                            backgroundImage: car.image == null
                                ? const AssetImage(ImagesUrl.defualtCar)
                                : NetworkImage(car.image!),
                          ),
                        ),
                      ),
                      Text(
                        car.type,
                        style: font12boldRamadi,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomListTile(
                          title: "لون",
                          titleTextStyle: font15BoldRamadi,
                          iconleading: const Icon(
                            Icons.color_lens,
                            size: 20,
                            color: MyColors.newrskey,
                          ),
                          subtitle: Text(
                            car.color,
                            style:
                                const TextStyle(color: MyColors.greyTextColor),
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomListTile(
                          title: "عدد الكراسي",
                          titleTextStyle: font15BoldRamadi,
                          iconleading: const Icon(
                            Icons.chair,
                            size: 20,
                            color: MyColors.newrskey,
                          ),
                          subtitle: Text(
                            "${car.seats}",
                            style: fontdefualtGreyText,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );

            case ProfileMode.myEdit:
              ProfileEditINfoCar(
                car: car,
              );
          }
        }

        return const SizedBox();
      },
    );
  }
}
