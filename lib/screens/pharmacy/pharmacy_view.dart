// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:dro_health_phamarcy/business_logic/searchbloc/search_bloc.dart';
import 'package:dro_health_phamarcy/data/models/pharm_categories.dart';
import 'package:dro_health_phamarcy/data/models/suggestions.dart';
import 'package:dro_health_phamarcy/screens/pharmacy/categories/view_all_categories.dart';
import 'package:dro_health_phamarcy/screens/pharmacy/product_detail.dart';
import 'package:dro_health_phamarcy/screens/shared/components.dart';
import 'package:dro_health_phamarcy/utils/colors.dart';
import 'package:dro_health_phamarcy/utils/constants.dart';
import 'package:dro_health_phamarcy/utils/navigation.dart';
import 'package:dro_health_phamarcy/utils/size_config.dart';
import 'package:dro_health_phamarcy/utils/styles.dart';
import 'package:dro_health_phamarcy/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PharmacyView extends StatefulWidget {
  const PharmacyView({Key? key}) : super(key: key);

  @override
  State<PharmacyView> createState() => _PharmacyViewState();
}

class _PharmacyViewState extends State<PharmacyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.shadeOfWhite,
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              topNav(),
              locationWidget(),
              UIHelper.verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'CATEGORIES',
                      style: headingBlack(),
                    ),
                    InkWell(
                      onTap: () {
                        pushPage(context, ViewAllCategories());
                      },
                      child: Text(
                        'VIEW ALL',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 28.sp,
                            color: AppColors.droPurple),
                      ),
                    ),
                  ],
                ),
              ),
              _buildCategories(),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('SUGGESTIONS', style: headingBlack()),
              ),
              gridViewLarge(
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      pushPage(
                        context,
                        ProductDetail(suggestionss: suggestions[index]),
                      );
                    },
                    child: suggestionsCard(
                        context: context, suggestions: suggestions[index]),
                  );
                },
              ),
              UIHelper.verticalSpaceRegular,
            ],
          ),
        ),
      ),
      floatingActionButton: fab(),
    );
  }

  Widget _buildCategories() {
    SizeConfig.init(context);
    return SizedBox(
      height: SizeConfig.screenHeight! / 4.5,
      child: ListView.builder(
        //itemExtent: 50.0,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: pharmCategories.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return categoriesCard(index);
        },
      ),
    );
  }

  Widget fab() {
    return SizedBox(
      height: 60,
      width: 160,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.white, width: 3),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              AppColors.firstRed,
              AppColors.secondRed,
            ],
          ),
        ),
        child: Row(
          children: [
            UIHelper.horizontalSpaceSmall,
            Text('Checkout', style: heading5()),
            UIHelper.horizontalSpaceSmall,
            SvgPicture.asset("$SVG_ASSETS_BASE/shopping_cart.svg"),
            UIHelper.horizontalSpaceSmall,
            Badge(
              badgeColor: AppColors.gold,
              badgeContent: const Text('2'),
            ),
          ],
        ),
      ),
    );
  }

  Widget locationWidget() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 69,
      color: AppColors.grey,
      child: Row(
        children: [
          SvgPicture.asset(locationMarker),
          UIHelper.horizontalSpaceSmall,
          RichText(
            text: TextSpan(text: 'Delivery in', style: bodyText1(), children: [
              TextSpan(text: ' Lagos, NG', style: bodyTextBold1())
            ]),
          ),
        ],
      ),
    );
  }

  Widget topNav() {
    return Stack(
      children: [
        Image.asset('assets/images/large_background.png'),
        Positioned(
            bottom: 60,
            left: 20,
            child: Row(
              children: [
                Text(
                  'Pharmacy',
                  style: heading5(),
                )
              ],
            )),
        Padding(
          padding: EdgeInsets.only(top: 100, left: 10, right: 20),
          child: TextField(
            onTap: () {
              showSearch(
                  context: context,
                  delegate: DrugSearch(
                      searchBloc: BlocProvider.of<SearchBloc>(context)));
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: heading4(),
                prefixIcon:
                    Icon(Icons.search, color: AppColors.white, size: 13)),
          ),
        ),
        Positioned(
          bottom: 58,
          right: 20,
          child: Image.asset('assets/images/delivery.png',
              width: 20, color: AppColors.white),
        ),
      ],
    );
  }
}

class DrugSearch extends SearchDelegate {
  SearchBloc? searchBloc;
  DrugSearch({@required this.searchBloc});
  String? queryString;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    queryString = query;
    searchBloc!.add(Search(query: query));
    return BlocBuilder<SearchBloc, SearchState>(
        builder: (BuildContext context, SearchState state) {
      if (state is SearchInitial) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is SearchError) {
        return Column(
          children: [
            SvgPicture.asset('$SVG_ASSETS_BASE/404.svg'),
            UIHelper.verticalSpaceRegular,
            Text(
              'No result found for $query',
              style: headingBlack(),
            ),
          ],
        );
      }
      if (state is SearchLoaded) {
        if (state.suggestions!.isEmpty) {
          return Column(
            children: [
              SvgPicture.asset('$SVG_ASSETS_BASE/404.svg'),
              UIHelper.verticalSpaceRegular,
              Text(
                'No result found for $query',
                style: headingBlack(),
              ),
            ],
          );
        }
        return gridViewLarge(
          itemCount: state.suggestions!.length,
          itemBuilder: (context, index) {
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
                            state.suggestions![index].imagePath!,
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
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.suggestions![index].drugName!,
                              style: headingBlack(),
                            ),
                            UIHelper.verticalSpaceTiny,
                            Row(
                              children: [
                                Text(state.suggestions![index].drugType!,
                                    style: bodyBlack()),
                                UIHelper.horizontalSpaceTiny,
                                Container(
                                  child: Text(''),
                                  width: 5,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: AppColors.darkGrey,
                                      shape: BoxShape.circle),
                                ),
                                UIHelper.horizontalSpaceTiny,
                                Text(state.suggestions![index].drugMeasurement!,
                                    style: bodyBlack()),
                              ],
                            ),
                            UIHelper.verticalSpaceSmall,
                            Text(state.suggestions![index].drugPrice,
                                style: moneyText()),
                          ]),
                    ),
                  )
                ],
              ),
            );
          },
        );
      }
      return Scaffold();
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
