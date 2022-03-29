import 'package:badges/badges.dart';
import 'package:dro_health_phamarcy/data/bloc/product_counter_bloc/product_counter_bloc.dart';
import 'package:dro_health_phamarcy/data/bloc/productdetail_bloc/product_detail_bloc.dart';
import 'package:dro_health_phamarcy/data/models/suggestions.dart';
import 'package:dro_health_phamarcy/screens/cart/cart_page.dart';
import 'package:dro_health_phamarcy/screens/shared/components.dart';
import 'package:dro_health_phamarcy/utils/colors.dart';
import 'package:dro_health_phamarcy/utils/navigation.dart';
import 'package:dro_health_phamarcy/utils/size_config.dart';
import 'package:dro_health_phamarcy/utils/styles.dart';
import 'package:dro_health_phamarcy/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetail extends StatelessWidget {
  final Suggestions? suggestionss;
  const ProductDetail({Key? key, this.suggestionss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailBloc _productDetailBloc =
        BlocProvider.of<ProductDetailBloc>(context);

    ProductCounterBloc _productCounterBloc =
        BlocProvider.of<ProductCounterBloc>(context);
    int count = 0;

    return Scaffold(
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            'Pharmacy',
                            style: heading5(),
                          )
                        ],
                      )),
                  Positioned(
                    bottom: 58,
                    right: 20,
                    child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
                        builder: (context, state) {
                      if (state is AddProductToCartState) {
                        ++count;
                      } else {
                        --count;
                        if (count < 0) {
                          count = 0;
                        }
                      }
                      return Badge(
                          badgeContent: Text(
                              _productDetailBloc.productsLength.toString()),
                          child: InkWell(
                              onTap: () {
                                pushPage(context, CartPage());
                              },
                              child:
                                  SvgPicture.asset('assets/images/cart.svg')));
                    }),
                  ),
                ],
              ),
              UIHelper.verticalSpaceSmall,
              Center(child: Image.asset(suggestionss!.imagePath!)),
              UIHelper.verticalSpaceSmall,
              Center(
                child: Text(
                  suggestionss!.drugName!,
                  style: headingBlackBig(),
                ),
              ),
              UIHelper.verticalSpaceSmall,
              Center(
                child: Text(
                    '${suggestionss!.drugType!} - ${suggestionss!.drugMeasurement!}',
                    style: bodyText2()),
              ),
              UIHelper.verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/emzor.png'),
                        UIHelper.horizontalSpaceSmall,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('SOLD BY', style: bodyTextBlue()),
                            UIHelper.verticalSpaceTiny,
                            Text('Emzor Pharmaceuticals', style: headingBlue()),
                          ],
                        ),
                      ],
                    ),
                    Image.asset('assets/images/favorite.png'),
                  ],
                ),
              ),
              UIHelper.verticalSpaceRegular,
              BlocBuilder<ProductCounterBloc, ProductCounterState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _productCounterBloc
                                        .add(IncrementProductEvent());
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    size: 13,
                                    color: AppColors.black,
                                  )),
                              Text(
                                state.counter.toString(),
                                style: headingBlack(),
                              ),
                              IconButton(
                                  onPressed: () {
                                    _productCounterBloc
                                        .add(DecrementProductEvent());
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 13,
                                    color: AppColors.black,
                                  )),
                            ],
                          ),
                          height: SizeConfig.screenHeight! / 15,
                          width: SizeConfig.screenWidth! / 3.1,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  width: 1, color: AppColors.darkGrey)),
                        ),
                      ),
                      Text('Pack(s)', style: bodyBlack()),
                      UIHelper.horizontalSpaceExtraLarge,
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: Image.asset('assets/images/naira.png', width: 6),
                      ),
                      Text(
                        suggestionss!.drugPrice,
                        style: moneyText(),
                      ),
                    ],
                  );
                },
              ),
              UIHelper.verticalSpaceRegular,
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text('PRODUCT DETAILS',
                    style: headingBlack().copyWith(color: AppColors.lightBlue)),
              ),
              UIHelper.verticalSpaceRegular,
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/pack_size.svg'),
                        UIHelper.horizontalSpaceTiny,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PACK SIZE',
                              style: bodyTextBlue().copyWith(
                                  fontSize: 8, fontWeight: FontWeight.w400),
                            ),
                            Text('8 x 12 tablets (96)',
                                style: bodyTextBlue().copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: AppColors.darkBlue)),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/barcode.svg'),
                        UIHelper.horizontalSpaceTiny,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PRODUCT ID',
                              style: bodyTextBlue().copyWith(
                                  fontSize: 8, fontWeight: FontWeight.w400),
                            ),
                            Text(suggestionss!.id!,
                                style: bodyTextBlue().copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: AppColors.darkBlue)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpaceRegular,
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/constituents.svg'),
                        UIHelper.horizontalSpaceTiny,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CONSTITUENTS',
                              style: bodyTextBlue().copyWith(
                                  fontSize: 8, fontWeight: FontWeight.w400),
                            ),
                            Text(suggestionss!.drugName!,
                                style: bodyTextBlue().copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: AppColors.darkBlue)),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/dispense.svg'),
                        UIHelper.horizontalSpaceTiny,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DISPENSED IN',
                              style: bodyTextBlue().copyWith(
                                  fontSize: 8, fontWeight: FontWeight.w400),
                            ),
                            Text('Packs',
                                style: bodyTextBlue().copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: AppColors.darkBlue)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpaceRegular,
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(suggestionss!.description!,
                    style: bodyText1()
                        .copyWith(fontSize: 13, color: AppColors.darkGrey)),
              ),
              UIHelper.verticalSpaceMedium,
              UIHelper.verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Similar Products',
                  style: heading5().copyWith(color: AppColors.darkGrey),
                ),
              ),
              SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: suggestions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return suggestionsCardSmall(
                          context: context, suggestions: suggestions[index]);
                    },
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          AppColors.firstPurple,
                          AppColors.secondPurple,
                        ],
                      )),
                  child: ElevatedButton(
                      onPressed: () {
                        _productDetailBloc
                            .add(AddProductEvent(suggestions: suggestionss));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        // elevation: MaterialStateProperty.all(3),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/cart.svg'),
                          UIHelper.horizontalSpaceSmall,
                          Text('Add to Cart', style: heading4())
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
