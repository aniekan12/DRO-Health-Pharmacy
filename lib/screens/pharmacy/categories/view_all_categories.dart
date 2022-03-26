import 'package:dro_health_phamarcy/data/models/pharm_categories.dart';
import 'package:dro_health_phamarcy/screens/shared/components.dart';
import 'package:dro_health_phamarcy/utils/colors.dart';
import 'package:dro_health_phamarcy/utils/navigation.dart';
import 'package:dro_health_phamarcy/utils/size_config.dart';
import 'package:dro_health_phamarcy/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ViewAllCategories extends StatefulWidget {
  const ViewAllCategories({Key? key}) : super(key: key);

  @override
  State<ViewAllCategories> createState() => _ViewAllCategoriesState();
}

class _ViewAllCategoriesState extends State<ViewAllCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/back.png'),
                  Positioned(
                      bottom: 60,
                      left: 10,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              popPage(context);
                            },
                            child: const Icon(Icons.arrow_back_ios,
                                size: 12, color: AppColors.white),
                          ),
                          Text(
                            'Categories',
                            style: heading5(),
                          )
                        ],
                      )),
                  Positioned(
                    bottom: 58,
                    right: 20,
                    child: SvgPicture.asset('assets/images/cart.svg'),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight,
                child: gridView(
                  itemCount: largepharmCategories.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Image.asset(
                          largepharmCategories[index].categoryImage!,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: 80,
                          bottom: 60,
                          child: Text(
                            largepharmCategories[index].categoryName!,
                            style: heading4(),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
