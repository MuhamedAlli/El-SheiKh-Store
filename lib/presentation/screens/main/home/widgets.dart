import 'package:elsheikh_store/domain/model/models.dart';
import 'package:elsheikh_store/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

Widget productItem(BuildContext context, Products product) {
  return Container(
    margin: const EdgeInsets.all(AppMargin.m8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.network(
          product.image,
          width: AppSize.s100,
          height: AppSize.s100,
        ),
        Text(
          product.title.substring(0, 15),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.price.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Icon(
              Icons.favorite_outline,
            ),
          ],
        ),
      ],
    ),
  );
}
