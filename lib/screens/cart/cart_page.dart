import 'package:dro_health_phamarcy/data/bloc/cart_bloc/cart_bloc.dart';
import 'package:dro_health_phamarcy/data/models/suggestions.dart';
import 'package:dro_health_phamarcy/utils/colors.dart';
import 'package:dro_health_phamarcy/utils/navigation.dart';
import 'package:dro_health_phamarcy/utils/size_config.dart';
import 'package:dro_health_phamarcy/utils/styles.dart';
import 'package:dro_health_phamarcy/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (context) => CartBloc(),
      child: const _CartPage(),
    );
  }
}

class _CartPage extends StatefulWidget {
  const _CartPage({Key? key}) : super(key: key);

  @override
  State<_CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<_CartPage> {
  static const numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  var _selectedNumber;
  double totalAmount = 0;

  void calculateTotalAmount(List<Suggestions> items, quantity) {
    double result = 0;

    items.forEach((element) {
      result = result + double.parse(element.drugPrice) * quantity;
    });
    totalAmount = result;
  }

  @override
  Widget build(BuildContext context) {
    CartBloc _cartBloc = BlocProvider.of<CartBloc>(context);
    _cartBloc.add(LoadCartItems());

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return Scaffold(
            body: SizedBox(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/images/back.png'),
                      Positioned(
                        bottom: 58,
                        left: 50,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/cart.svg',
                            ),
                            UIHelper.horizontalSpaceRegular,
                            Text(
                              'Cart',
                              style: heading5(),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 60,
                          left: 20,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  popPage(context);
                                },
                                child: const Icon(Icons.arrow_back_ios,
                                    size: 18, color: AppColors.white),
                              ),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 400,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: state.cartItems!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            trailing: Column(
                              children: [
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      //color: AppColors.textColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButton<String>(
                                    underline: const SizedBox(),
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    hint: const Text(
                                        '1'), // Not necessary for Option 1
                                    value: _selectedNumber,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedNumber = newValue;
                                        print(_selectedNumber);
                                      });
                                    },
                                    items: numbers.map((nums) {
                                      return DropdownMenuItem<String>(
                                        child: Text(nums),
                                        value: nums,
                                      );
                                    }).toList(),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      state.cartItems!.removeAt(index);
                                    });
                                  },
                                  child: SvgPicture.asset(
                                      'assets/images/delete.svg'),
                                )
                              ],
                            ),
                            leading:
                                Image.asset(state.cartItems![index].imagePath!),
                            title: Text(state.cartItems![index].drugName!,
                                style: headingBlack()),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(state.cartItems![index].drugType!),
                                    UIHelper.horizontalSpaceTiny,
                                    Container(
                                      child: const Text(''),
                                      width: 5,
                                      height: 10,
                                      decoration: const BoxDecoration(
                                          color: AppColors.darkGrey,
                                          shape: BoxShape.circle),
                                    ),
                                    UIHelper.horizontalSpaceTiny,
                                    Text(state
                                        .cartItems![index].drugMeasurement!),
                                  ],
                                ),
                                Text(state.cartItems![index].drugPrice,
                                    style: moneyText()),
                              ],
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          body: SizedBox(
            height: SizeConfig.screenHeight,
            child: Column(children: [
              Stack(
                children: [
                  Image.asset('assets/images/back.png'),
                  Positioned(
                    bottom: 58,
                    left: 50,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/cart.svg',
                        ),
                        UIHelper.horizontalSpaceRegular,
                        Text(
                          'Cart',
                          style: heading5(),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 60,
                      left: 20,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              popPage(context);
                            },
                            child: const Icon(Icons.arrow_back_ios,
                                size: 18, color: AppColors.white),
                          ),
                        ],
                      )),
                ],
              ),
              UIHelper.verticalSpaceLarge,
              const Center(
                child: Text('No Items inside cart'),
              )
            ]),
          ),
        );
      },
    );
  }
}
