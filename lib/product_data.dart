import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_task/product_item.dart';

import 'api/api.dart';
import 'api/product_response.dart';

class ProductData extends StatefulWidget {
  ProductData({super.key});

  @override
  State<ProductData> createState() => _ProductDataState();
}

class _ProductDataState extends State<ProductData> {
  late Future<ProductResponse> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = APImanager.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductResponse>(
      future: futureProducts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
              child: Text("Something went wrong",
                  style: TextStyle(color: Colors.white)));
        }
        if (!snapshot.hasData || snapshot.data!.products!.isEmpty) {
          return Center(
              child: Text("No Data", style: TextStyle(color: Colors.white)));
        }
        final products = snapshot.data!.products;

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemCount: products?.length,
          itemBuilder: (context, index) {
            return ProductItem(product: products![index]);
          },
        );
      },
    );
  }
}
