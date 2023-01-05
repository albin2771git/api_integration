import 'dart:ffi';

import 'package:api_integration/Models/ProductModels.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductTile extends StatelessWidget {
  final ProductsModel product;
  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(product.title!,
                maxLines: 2,
                style: TextStyle(
                  fontFamily: 'avanir',
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis),
            SizedBox(
              height: 8,
            ),
            if (product.rating != null)
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating!.rate.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            SizedBox(
              height: 8,
            ),
            Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 32, fontFamily: 'avenir'),
            )
          ],
        ),
      ),
    );
  }
}
