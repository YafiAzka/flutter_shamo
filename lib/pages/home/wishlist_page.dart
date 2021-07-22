import 'package:flutter/material.dart';
import 'package:flutter_shamo/pages/widgets/wishlist_cart.dart';
import 'package:flutter_shamo/providers/page_provider.dart';
import 'package:flutter_shamo/providers/wishlist_provider.dart';
import 'package:flutter_shamo/theme.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text('Favorite Shoes'),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptywishlist() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Image_Wishlist.png',
                width: 74,
              ),
              SizedBox(height: 23),
              Text(
                ' You don\'t have dream shoes?',
                style: primaryTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(
                'Let\'s find your favorite shoes',
                style: secondaryTextStyle,
              ),
              SizedBox(height: 20),
              Container(
                height: 44,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    pageProvider.currentIndex = 0;
                  },
                  child: Text(
                    'Explore Store',
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              children: wishlistProvider.wishlist
                  .map(
                    (product) => WishlistCard(product),
                  )
                  .toList()),
        ),
      );
    }

    return Column(
      children: [
        header(),
        // emptywishlist(),
        wishlistProvider.wishlist.length == 0 ? emptywishlist() : content(),
      ],
    );
  }
}
