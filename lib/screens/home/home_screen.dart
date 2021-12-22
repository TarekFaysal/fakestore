import 'package:fakestore/model/product.dart';
import 'package:fakestore/model/products_categories.dart';
import 'package:fakestore/screens/home/components/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var productsAndCategories =
        ModalRoute.of(context)?.settings.arguments as ProductsAndCategories;
    List<Product>? products = productsAndCategories.products;
    List<String>? categories = productsAndCategories.categories;

    return DefaultTabController(
      length: categories!.length,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Fake Store"),
            bottom: TabBar(
              isScrollable: true,
              tabs: categories
                  .map((item) => Tab(
                        text: item,
                      ))
                  .toList(),
            ),
          ),
          //AllMovies.where((i) => i.isAnimated).toList()
          body: TabBarView(
            children: categories
                .map((item) => GridView.builder(
                      itemCount: products
                          ?.where((element) => element.category == item)
                          .toList()
                          .length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.2 / 2,
                      ),
                      itemBuilder: (context, index) {
                        List<Product> categoryProducts = products!
                            .where((element) => element.category == item)
                            .toList();
                        return ProductCard(
                          title: categoryProducts[index].title,
                          price: categoryProducts[index].price,
                          image: categoryProducts[index].image,
                        );
                      },
                    ))
                .toList(),
          )),
    );
  }
}
