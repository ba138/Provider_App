import 'package:flutter/material.dart';
import 'package:provider_app/model/home_model.dart';
import 'package:provider_app/model/productModel.dart';
import 'package:provider_app/repository/home_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeRepository homeRepository = HomeRepository();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<HomeModel>(
        future: homeRepository.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          } else {
            List<Product> allProducts = snapshot.data!.allProducts;

            return ListView.builder(
              itemCount: allProducts.length,
              itemBuilder: (context, index) {
                Product product = allProducts[index];

                return ListTile(
                  title: Text('ID: ${product.id}'),
                  subtitle: Text('Title: ${product.title}'),
                  leading: Image.network(product.thumbnailImage),
                );
              },
            );
          }
        },
      ),
    );
  }
}
