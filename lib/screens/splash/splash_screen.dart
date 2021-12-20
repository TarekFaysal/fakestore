import 'package:fakestore/model/api_response.dart';
import 'package:fakestore/model/product.dart';
import 'package:fakestore/model/products_categories.dart';
import 'package:fakestore/screens/home/home_screen.dart';
import 'package:fakestore/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ProductService get productService => GetIt.I<ProductService>();
  APIResponse<List<String>>? _apiResponseCategories;
  APIResponse<List<Product>>? _apiResponseProducts;

  void _getAllData() async {
    setState(() {});
    _apiResponseCategories = await productService.getAllCategories();
    _apiResponseProducts = await productService.getAllProducts();
    var productsAndCategories = ProductsAndCategories(
        products: _apiResponseProducts?.data,
        categories: _apiResponseCategories?.data);

    setState(() {});
    Navigator.of(context)
        .pushNamed(HomeScreen.routeName, arguments: productsAndCategories);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          height: 100,
          width: 100,
          image: AssetImage("assets/images/fakestorelogo.jpg"),
        ),
      ),
    );
  }
}
