import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:route_task/domain/product/product.dart';

import 'data/models/productModel.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Container(
    decoration: BoxDecoration(
    border: Border.all(
    color: Colors.blue,
    width: 1.0,),  borderRadius: BorderRadius.circular(10.0),),
     child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
          imageUrl: product.thumbnail,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          height: 135,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'EGP ${product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${product.discountPercentage.toStringAsFixed(2)} EGP',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.blue,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text('Review (${product.rating})',
                    style: TextStyle(fontSize: 14)),
                SizedBox(width: 10),
                Icon(Icons.star, color: Colors.yellow, size: 20),
              ],
            ),
          ),

        ],
      ),)
    );
  }
}
