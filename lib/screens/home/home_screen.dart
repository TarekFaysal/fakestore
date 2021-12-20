import 'package:fakestore/model/product.dart';
import 'package:fakestore/model/products_categories.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productsAndCategories =
        ModalRoute.of(context)?.settings.arguments as ProductsAndCategories;
    List<Product>? products = productsAndCategories.products;
    List<String>? categories = productsAndCategories.categories;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fake Store"),
      ),
      body: ListView.builder(
        itemBuilder: (contex, index) {
          return Text(products![index].category!);
        },
        itemCount: products!.length,
      ),
    );
  }
}
