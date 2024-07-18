import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_task/product_data.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Route',style: TextStyle(color: CupertinoColors.systemBlue)
        ),
    ),
    body:  Column(
      children: [
        Row(
          children: [
            Container(
              // Add padding around the search bar
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              // Use a Material design search bar
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Perform the search here
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),

          ],
        ),Expanded(child: ProductData())
      ],
    ),
    );

  }
    }
