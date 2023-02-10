import 'package:elsheikh_store/domain/model/models.dart';
import 'package:elsheikh_store/presentation/resources/color_manager.dart';
import 'package:elsheikh_store/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

Widget productItem(BuildContext context, Products product) {
  return Stack(
    alignment: Alignment.topLeft,
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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
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
            RatingBar(
              rating: product.rating.rate,
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

class RatingBar extends StatelessWidget {
  const RatingBar({required this.rating, super.key});
  final double rating;
  @override
  Widget build(BuildContext context) {
    List<Widget> listStars = [];
    int realNumber = rating.floor();
    int partNumber = ((rating - realNumber) * 10).ceil();
    for (int i = 0; i < 5; i++) {
      if (i < realNumber) {
        listStars.add(const Icon(
          Icons.star,
          color: Colors.greenAccent,
          size: 22,
        ));
      } else if (i == realNumber) {
        listStars.add(SizedBox(
          width: 22,
          height: 22,
          child: Stack(
            fit: StackFit.expand,
            children: [
              const Icon(
                Icons.star,
                color: Colors.greenAccent,
                size: 22,
              ),
              ClipRect(
                clipper: Clipper(partNumber),
                child: const Icon(
                  Icons.star,
                  color: Colors.grey,
                  size: 22,
                ),
              ),
            ],
          ),
        ));
      } else {
        listStars.add(const Icon(
          Icons.star,
          color: Colors.grey,
          size: 22,
        ));
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: listStars,
    );
  }
}

class Clipper extends CustomClipper<Rect> {
  final int part;
  const Clipper(this.part);
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      (size.width / 10) * part,
      0.0,
      size.width,
      size.height,
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}
