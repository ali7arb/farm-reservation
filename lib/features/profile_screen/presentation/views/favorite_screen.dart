import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/core/utils/style.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../../model/farms/farms_model.dart';
import '../../../home_screen/auth/home_view_controller.dart';
import '../../../home_screen/presentation/views/details_screen.dart';

class FavoriteScreen extends StatelessWidget {
  final HomeViewController homeController = Get.find();

  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Favorite Farms'),
      ),
      body: Obx(
        () {
          List<FarmModel> favoriteFarms = homeController.farmModel
              // ignore: unrelated_type_equality_checks
              .where((farm) => farm.isFavorite == true)
              .toList();
          return ListView.separated(
            itemBuilder: (context, index) {
              FarmModel farm = favoriteFarms[index];
              String imageUrl = farm.images != null && farm.images!.isNotEmpty
                  ? farm.images![0]
                  : '';
              return InkWell(
                onTap: () {
                  Get.to(DetailsScreen(
                    farm: farm,
                  ));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .01,
                    horizontal: MediaQuery.of(context).size.width * .02,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 4,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: imageUrl.isNotEmpty
                                  ? DecorationImage(
                                      image: NetworkImage(imageUrl),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 13,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Color(0xffDDEFF8),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * .01,
                            horizontal: MediaQuery.of(context).size.width * .06,
                          ),
                          child: Row(
                            children: [
                              Styles.textstyle14(farm.name ?? '', mainColo),
                              const Spacer(),
                              CircleAvatar(
                                backgroundColor: Colors.grey.withOpacity(.5),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    homeController.toggleFavorite(index);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            itemCount: favoriteFarms.length,
          );
        },
      ),
    );
  }
}
