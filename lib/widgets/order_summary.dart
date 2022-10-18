import 'package:Toravel/blocs/cart/cart_bloc.dart';
import 'package:Toravel/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return Column(
            children: [
              SizedBox(
                  height: 100,
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
              Divider(
                thickness: 2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    decoration:
                        BoxDecoration(color: Colors.green.withAlpha(60)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("TOTAL", style: TextStyle(color: Colors.white)),
                          Text('RM${state.cart.totalString}.00',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else
          return Text("something went wrong");
      },
    );
  }
}
