import 'package:elsheikh_store/domain/model/models.dart';
import 'package:flutter/material.dart';

import '../main/home/widgets.dart';

class StoreDetailsView extends StatelessWidget {
  const StoreDetailsView({required this.productDetails, super.key});
  final Products productDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildSliverAppBar(context),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "Rate",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 24,
                              ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RatingBar(rating: productDetails.rating.rate),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Description",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 26,
                              ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      productDetails.description,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Price",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 24,
                              ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${productDetails.price} \$",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Quantity Available",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 24,
                              ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${productDetails.rating.count} Piece",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                    ),
                    const SizedBox(
                      height: 500,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 600,
      stretch: true,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0.0,
      pinned: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Text(
            productDetails.title,
            style: const TextStyle(
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        background: Hero(
          //May be Error here >> i will chek this later!!!
          tag: 13021997,
          child: Image.network(
            productDetails.image,
          ),
        ),
      ),
    );
  }
}
