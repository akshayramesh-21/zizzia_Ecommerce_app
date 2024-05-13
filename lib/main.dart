
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/CartGet/cart_get_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/banner/banner_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/cart_update/cart_item_pass_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/checkout/check_out_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/home_data_get/home_data_get_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/invoiceDownload/invoice_download_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/login/login_bloc_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/order_history/order_histroy_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/pagination/paginaton_refresh_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/profilePage/profile_page_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/razonpay/razon_payment_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/searchbare/search_bar_function_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/wishlist/wishlist_bloc.dart';
import 'package:zizzia_e_commerce/view/pages/login/login1.dart';
import 'package:zizzia_e_commerce/view/pages/on_boarding_screen/on_1.dart';
import 'package:zizzia_e_commerce/view/widgets/bottom_nav.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      autoSignInAndNavigate();
    });
    super.initState();
  }

  Future<void> autoSignInAndNavigate() async {
    try {
      final tokens = await Hive.openBox("TokenData");
      final tokenValue = tokens.get('token');
      print("Token value: $tokenValue");

      if (tokenValue != null && tokenValue.isNotEmpty) {
        print("Navigating to Home Page");
        navigatorKey.currentState
            ?.push(MaterialPageRoute(builder: (context) => BottomNavBar()));
      } 
    } catch (e) {
      print("Error in auto sign-in: $e");
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text("Error: $e. Please try again."),
        ),
      );
      // Navigate to login page in case of any error
      navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(builder: (context) => Login()));
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, Orientation, DeviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBlocBloc>(
            create: (context) => LoginBlocBloc(),
          ),
          BlocProvider<HomeDataGetBloc>(
            create: (context) => HomeDataGetBloc(),
          ),
          BlocProvider<ProfilePageBloc>(
            create: (context) => ProfilePageBloc(),
          ),
          BlocProvider<BannerBloc>(
            create: (context) => BannerBloc(),
          ),
          BlocProvider<CartGetBloc>(create: (context) => CartGetBloc()),
          BlocProvider<CartItemPassBloc>(
            create: (context) => CartItemPassBloc(),
          ),
          BlocProvider<WishlistBloc>(
            create: (context) => WishlistBloc(),
          ),
          BlocProvider<CheckOutBloc>(
            create: (context) => CheckOutBloc(),
          ),
          BlocProvider<RazonPaymentBloc>(
            create: (context) => RazonPaymentBloc(),
          ),
          BlocProvider<EditProfileBloc>(
            create: (context) => EditProfileBloc(),
          ),
          
          BlocProvider<SearchBarFunctionBloc>(
            create: (context) => SearchBarFunctionBloc(),

            ),

                   BlocProvider<PaginatonRefreshBloc>(
              create: (context) => PaginatonRefreshBloc(),
             
            ),

            BlocProvider<OrderHistroyBloc>(create: (context) => OrderHistroyBloc(),),
            BlocProvider<InvoiceDownloadBloc>(create: (context) => InvoiceDownloadBloc(),)
              

        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            //  Color.fromRGBO(213, 211, 203, 1),
             
     
             
              appBarTheme:
                  AppBarTheme(color: Colors.white,
                  // Color.fromRGBO(213, 211, 203, 1),
                  )
                  ),

            
     


          debugShowCheckedModeBanner: false,
          home: OnBoardPage(),
        ),
      );
    });
  }
}
