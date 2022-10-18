import 'package:carousel_slider/carousel_slider.dart';
import 'package:Toravel/blocs/cart/cart_bloc.dart';
import 'package:Toravel/blocs/wishlist/wishlist_bloc.dart';
import 'package:Toravel/blocs/wishlist/wishlist_event.dart';
import 'package:Toravel/blocs/wishlist/wishlist_state.dart';
import 'package:Toravel/models/category_model.dart';
import 'package:Toravel/models/product_model.dart';
import 'package:Toravel/widgets/custom_appbar.dart';
import 'package:Toravel/widgets/custom_navbar.dart';
import 'package:Toravel/widgets/hero_carousel_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: product.name),
        bottomNavigationBar: BottomAppBar(
            color: Color(0XFFABB4BD),
            child: Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.share, color: Colors.white),
                      onPressed: () {},
                    ),
                    BlocBuilder<WishlistBloc, WishlistState>(
                        builder: (context, state) {
                      return IconButton(
                        icon: Icon(Icons.favorite, color: Colors.white),
                        onPressed: () {
                          context
                              .read<WishlistBloc>()
                              .add(AddWishlistProduct(product));
                          final snackBar = SnackBar(
                              content: Text('Added to your Wishlist!',
                                  style: TextStyle(color: Colors.pinkAccent)));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      );
                    }),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        return ElevatedButton(
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(CartProductAdded(product));
                              Navigator.pushNamed(context, '/cart');
                            },
                            child: Text(
                              'Add To CART',
                            ));
                      },
                    )
                  ],
                ))),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                product.imageUrl,
                width: 100,
                height: 230,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        alignment: Alignment.bottomCenter,
                        color: Colors.black.withAlpha(50)),
                    Container(
                        margin: const EdgeInsets.all(5.0),
                        width: MediaQuery.of(context).size.width - 10,
                        height: 50,
                        alignment: Alignment.bottomCenter,
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(product.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Text('RM${product.price}.00',
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        )),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(
                        'Information',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.info_outline,
                          size: 20,
                        ),
                      ),
                    ]),
                    ListTile(
                      title: Text(
                        product.info,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
