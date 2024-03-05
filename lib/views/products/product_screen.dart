import 'package:devetechnologies_flutter_course/services/product_services.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static String routName = '/product-screen';
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductServices productServices = ProductServices();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products'),
      ),
      body: Center(
        child: FutureBuilder(
          future: productServices.getDataProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text(
                  snapshot.data!.body.toString().toString().substring(0, 500));
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
