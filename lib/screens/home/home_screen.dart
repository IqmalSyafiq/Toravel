import 'package:carousel_slider/carousel_slider.dart';
import 'package:Toravel/blocs/category/category_bloc.dart';
import 'package:Toravel/blocs/product/product_bloc.dart';
import 'package:Toravel/models/category_model.dart';
import 'package:Toravel/models/product_model.dart';
import 'package:Toravel/widgets/custom_appbar.dart';
import 'package:Toravel/widgets/custom_navbar.dart';
import 'package:Toravel/widgets/hero_carousel_card.dart';
import 'package:Toravel/widgets/product_card.dart';
import 'package:Toravel/widgets/product_carousel.dart';
import 'package:Toravel/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Toravel'),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Center(child: CircularProgressIndicator());
                  //   child: Text('circularindic'));
                } else if (state is ProductLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      initialPage: 2,
                    ),
                    items: state.products
                        .map((product) => HeroCarouselCard(product: product))
                        .toList(),
                  );
                } else
                  return Text("something went wrong");
              },
            )),
            SectionTitle(title: "Latest Travel Package"),
            //  ProductCard(product: Product.products[0]),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductLoaded) {
                  return ProductCarousel(
                      products: state.products
                          .where((product) => product.isLatest)
                          .toList());
                } else
                  return Text("something went wrong");
              },
            ),

            SectionTitle(title: "Most Popular"),
            //  ProductCard(product: Product.products[0]),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductLoaded) {
                  return ProductCarousel(
                      products: state.products
                          .where((product) => product.isPopular)
                          .toList());
                } else
                  return Text("something went wrong");
              },
            ),
          ],
        ),
      ),
    );
  }
}
