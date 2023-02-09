import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:elsheikh_store/presentation/business_logic/cubit/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/models.dart';
import '../../../resources/color_manager.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartCubit>(context).getproductsOfUserCart();
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        //List<CartModel> cartList = BlocProvider.of<CartCubit>(context).cartList;
        List<Products> productsOfUserCart =
            BlocProvider.of<CartCubit>(context).productsOfUserCart;
        List<ProductOfCatModel> productOfCatModel =
            BlocProvider.of<CartCubit>(context).productOfCartModel;
        double total = BlocProvider.of<CartCubit>(context).totalPrice;
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ConditionalBuilder(
                  condition: productOfCatModel.isNotEmpty &&
                      productsOfUserCart.isNotEmpty,
                  builder: (context) => Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 12,
                        );
                      },
                      itemCount: productsOfUserCart.length,
                      itemBuilder: (context, index) {
                        return _buildCartItem(context, productOfCatModel[index],
                            productsOfUserCart[index]);
                      },
                    ),
                  ),
                  fallback: (context) => const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    padding: const EdgeInsets.all(12.0),
                    //margin: const EdgeInsets.all(12.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Price",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: ColorManager.primary,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$total \$",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: ColorManager.primary,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCartItem(
      BuildContext context, ProductOfCatModel cartModel, Products products) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            products.image,
            height: 150,
            width: 150,
          ),
          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${products.price.toString()} \$",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorManager.primary,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove_circle,
                ),
              ),
              Text(
                cartModel.quantity.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
