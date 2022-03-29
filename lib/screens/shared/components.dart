import 'package:dro_health_phamarcy/data/models/pharm_categories.dart';
import 'package:dro_health_phamarcy/data/models/suggestions.dart';
import 'package:dro_health_phamarcy/screens/products/product_details/product_detail.dart';
import 'package:dro_health_phamarcy/utils/colors.dart';
import 'package:dro_health_phamarcy/utils/navigation.dart';
import 'package:dro_health_phamarcy/utils/size_config.dart';
import 'package:dro_health_phamarcy/utils/styles.dart';
import 'package:dro_health_phamarcy/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget gridViewSmall({
  @required int? itemCount,
  @required Widget Function(BuildContext context, int index)? itemBuilder,
  EdgeInsets? padding,
}) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 14,
        childAspectRatio: 3),
    itemBuilder: itemBuilder!,
    itemCount: itemCount,
    padding: padding,
    physics: BouncingScrollPhysics(),
  );
}

Widget gridView({
  @required int? itemCount,
  @required Widget Function(BuildContext context, int index)? itemBuilder,
  EdgeInsets? padding,
}) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        childAspectRatio: 1),
    itemBuilder: itemBuilder!,
    itemCount: itemCount,
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    physics: BouncingScrollPhysics(),
  );
}

Widget gridViewLarge({
  @required int? itemCount,
  @required Widget Function(BuildContext context, int index)? itemBuilder,
  EdgeInsets? padding,
}) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 10,
        childAspectRatio: 1),
    itemBuilder: itemBuilder!,
    itemCount: itemCount,
    shrinkWrap: true,
    // padding: EdgeInsets.zero,
    physics: BouncingScrollPhysics(),
  );
}

Widget categoriesCard(int index) {
  return SizedBox(
    height: SizeConfig.screenHeight,
    child: Column(
      children: [
        Stack(
          children: [
            Image.asset(
              pharmCategories[index].categoryImage!,
              fit: BoxFit.fill,
            ),
            Positioned(
              right: 60,
              bottom: 70,
              child: Text(
                pharmCategories[index].categoryName!,
                style: heading4(),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget suggestionsCard({BuildContext? context, Suggestions? suggestions}) {
  return SizedBox(
    width: SizeConfig.screenWidth! / 10,
    height: 400,
    child: Stack(
      children: <Widget>[
        Card(
          color: AppColors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              SizedBox(
                width: 335,
                height: 90,
                child: Image.asset(
                  suggestions!.imagePath!,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0,
          margin: EdgeInsets.all(10),
        ),
        Positioned(
          top: 105,
          left: 20,
          child: SizedBox(
            height: 100,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                suggestions.drugName!,
                style: headingBlack(),
              ),
              UIHelper.verticalSpaceTiny,
              Row(
                children: [
                  Text(suggestions.drugType!, style: bodyBlack()),
                  UIHelper.horizontalSpaceTiny,
                  Container(
                    child: Text(''),
                    width: 5,
                    height: 10,
                    decoration: BoxDecoration(
                        color: AppColors.darkGrey, shape: BoxShape.circle),
                  ),
                  UIHelper.horizontalSpaceTiny,
                  Text(suggestions.drugMeasurement!, style: bodyBlack()),
                ],
              ),
              UIHelper.verticalSpaceSmall,
              Text(suggestions.drugPrice, style: moneyText()),
            ]),
          ),
        )
      ],
    ),
  );
}

Widget suggestionsCardSmall({BuildContext? context, Suggestions? suggestions}) {
  return SizedBox(
    width: SizeConfig.screenWidth! / 2,
    // height: 30,
    child: Stack(
      children: <Widget>[
        Card(
          color: AppColors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              SizedBox(
                width: 335,
                height: 90,
                child: Image.asset(
                  suggestions!.imagePath!,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0,
          margin: EdgeInsets.all(10),
        ),
        Positioned(
          top: 105,
          left: 20,
          child: SizedBox(
            height: 100,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                suggestions.drugName!,
                style: headingBlack(),
              ),
              UIHelper.verticalSpaceTiny,
              Row(
                children: [
                  Text(suggestions.drugType!, style: bodyBlack()),
                  UIHelper.horizontalSpaceTiny,
                  Container(
                    child: Text(''),
                    width: 5,
                    height: 10,
                    decoration: BoxDecoration(
                        color: AppColors.darkGrey, shape: BoxShape.circle),
                  ),
                  UIHelper.horizontalSpaceTiny,
                  Text(suggestions.drugMeasurement!, style: bodyBlack()),
                ],
              ),
              UIHelper.verticalSpaceSmall,
              Text(suggestions.drugPrice, style: moneyText()),
            ]),
          ),
        )
      ],
    ),
  );
}
