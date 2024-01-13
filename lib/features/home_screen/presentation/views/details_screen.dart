import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/features/home_screen/auth/details_controller.dart';
import 'package:reservation_farm/features/home_screen/presentation/views/widget/app_bar.dart';
import 'package:reservation_farm/features/home_screen/presentation/views/widget/calender_screen.dart';
import 'package:reservation_farm/features/home_screen/presentation/views/widget/custem_text_name.dart';
import 'package:reservation_farm/features/home_screen/presentation/views/widget/indicator_widget.dart';

import '../../../../core/utils/style.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custem_button_widget.dart';
import '../../../../model/farms/farms_model.dart';

class DetailsScreen extends StatelessWidget {
  final FarmModel farm;

  const DetailsScreen({Key? key, required this.farm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailsController controller = Get.put(DetailsController());

    controller.updateImageCount(farm.images);

    return GetBuilder<DetailsController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: const CustomAppBar(
            text: 'Details',
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustemTextName(
                  name: farm.name ?? 'Default Name',
                  color: mainColo,
                  size: 25,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      controller.currentPage.value = index;
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          image: farm.images != null && farm.images!.isNotEmpty
                              ? DecorationImage(
                                  image: NetworkImage(farm.images![index]),
                                  fit: BoxFit.cover,
                                )
                              : const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/default_image.jpg'),
                                  fit: BoxFit.cover,
                                ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      );
                    },
                    itemCount: farm.images?.length ?? 0,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Obx(
                  () => IndicatorWidget(
                    count: controller.imageCount.value,
                    currentPage: controller.currentPage.value,
                  ),
                ),
                Styles.textstyle30('Details:', mainColo),
                Styles.textstyle14(
                  farm.description ?? 'No description available',
                  Colors.black,
                ),
                Styles.textstyle30('Price:', mainColo),
                Column(
                  children: farm.price!.map((e) {
                    return Styles.textstyle14(e, Colors.black);
                  }).toList(),
                ),
                const Spacer(),
                CustemButtonWidget(
                  onPressed: () {
                    Get.to(const CalenderScreen());
                  },
                  title: 'Book',
                  textColor: textColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
