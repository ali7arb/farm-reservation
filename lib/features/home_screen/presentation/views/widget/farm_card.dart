import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/features/home_screen/auth/home_view_controller.dart';

import '../../../../../model/farms/farms_model.dart';
import '../details_screen.dart';
import 'custem_farm_details.dart';

class FarmCard extends StatelessWidget {
  final FarmModel farm;
  final int index;

  const FarmCard({Key? key, required this.farm, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        farm.images != null && farm.images!.isNotEmpty ? farm.images![0] : '';
    return InkWell(
      onTap: () {
        Get.to(DetailsScreen(
          farm: farm,
        ));
      },
      child: GetBuilder<HomeViewController>(
        builder: (controller) => Column(
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
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: IconButton(
                    onPressed: () {
                      controller.toggleFavorite(index);
                    },
                    icon: Icon(
                      farm.isFavorite == true
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
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
                child: CustemFarmDetails(
                  farmName: farm.name ?? 'Default Name',
                  location: farm.location ?? 'Default Location',
                  price: farm.price != null && farm.price!.isNotEmpty
                      ? farm.price![0]
                      : 'Default Price',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
