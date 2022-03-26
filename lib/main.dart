import 'package:dro_health_phamarcy/data/bloc/product_counter_bloc/product_counter_bloc.dart';
import 'package:dro_health_phamarcy/data/bloc/productdetail_bloc/product_detail_bloc.dart';
import 'package:dro_health_phamarcy/screens/pharm_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'business_logic/searchbloc/search_bloc.dart';
import 'data/repository/search_repository.dart';

void main() {
  Bloc.observer = BlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 1412),
      minTextAdapt: true,
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => SearchBloc(
                    searchDrugsRepository: SearchDrugsRepositoryImpl(),
                  )),
          BlocProvider(
              create: (_) => ProductDetailBloc(ProductDetailInitial())),
          BlocProvider(create: (_) => ProductCounterBloc())
        ],
        child: MaterialApp(
          home: const PharmDahsboard(),
          theme: ThemeData(
            fontFamily: 'Proxima Nova',
          ),
        ),
      ),
    );
  }
}
