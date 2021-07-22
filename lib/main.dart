import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shamo/pages/checkout_success.dart';
import 'package:flutter_shamo/pages/home/home_page.dart';
import 'package:flutter_shamo/providers/auth_provider.dart';
import 'package:flutter_shamo/providers/cart_provider.dart';
import 'package:flutter_shamo/providers/page_provider.dart';
import 'package:flutter_shamo/providers/product_provider.dart';
import 'package:flutter_shamo/providers/transaction_provider.dart';
import 'package:flutter_shamo/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';
import 'pages/cart_page.dart';
import 'pages/checkout_page.dart';
import 'pages/detail_chat_page.dart';
import 'pages/edit_profile_page.dart';
import 'pages/home/main_page.dart';
import 'pages/sign_up_page.dart';
import 'pages/splash_page.dart';
import 'pages/sign_in_page.dart';

// import 'theme.dart';
// import 'package:getwidget/getwidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
