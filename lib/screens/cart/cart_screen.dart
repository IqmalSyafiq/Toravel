import 'package:Toravel/blocs/cart/cart_bloc.dart';
import 'package:Toravel/models/cart_model.dart';
import 'package:Toravel/models/product_model.dart';
import 'package:Toravel/widgets/bottom_appbar.dart';
import 'package:Toravel/widgets/cart_product_card.dart';
import 'package:Toravel/widgets/custom_appbar.dart';
import 'package:Toravel/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Cart'),
      bottomNavigationBar: BottomAppbar(),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading)
            return CircularProgressIndicator();
          else if (state is CartLoaded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            height: 500,
                            child: ListView.builder(
                                itemCount: state.cart
                                    .productQuantity(state.cart.products)
                                    .keys
                                    .length,
                                itemBuilder: (context, index) {
                                  return CartProductCard(
                                    product: state.cart
                                        .productQuantity(state.cart.products)
                                        .keys
                                        .elementAt(index),
                                    quantity: state.cart
                                        .productQuantity(state.cart.products)
                                        .values
                                        .elementAt(index),
                                  );
                                })),
                      ],
                    ),
                    Column(
                      children: [
                        //***** */
                        Divider(
                          thickness: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Subtotal"),
                                  Text("RM${state.cart.subtotalString}.00"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.green.withAlpha(60)),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(color: Colors.black),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("TOTAL",
                                        style: TextStyle(color: Colors.white)),
                                    Text('RM${state.cart.totalString}.00',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        //**** */
                      ],
                    )
                  ]),
            );
          } else
            return Text("something went wrong");
        },
      ),
    );
  }
}
