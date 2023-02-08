import 'package:elsheikh_store/domain/model/models.dart';
import 'package:elsheikh_store/presentation/resources/color_manager.dart';
import 'package:elsheikh_store/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

Widget productItem(BuildContext context, Products product) {
  return Stack(
    alignment: Alignment.bottomLeft,
    children: [
      Container(
        padding: const EdgeInsets.all(AppPadding.p2),
        //color: Colors.blueAccent,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey[300]!,
          ),
        ),
        margin: const EdgeInsets.all(2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              product.image,
              width: AppSize.s100,
              height: AppSize.s100,
            ),
            Text(
              product.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${product.price} \$",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorManager.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      if (product.rating.rate >= 3)
        Container(
          margin: const EdgeInsets.all(AppMargin.m2),
          padding: const EdgeInsets.all(
            AppPadding.p2,
          ),
          color: Colors.red,
          child: const Text(
            "DISCOUNT",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
    ],
  );
}
