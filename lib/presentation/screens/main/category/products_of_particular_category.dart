import 'package:elsheikh_store/presentation/business_logic/cubit/cubit_products/category_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/models.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/values_manager.dart';
import '../home/widgets.dart';

class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage(this.catName, {super.key});
  // ignore: prefer_typing_uninitialized_variables
  final catName;

  @override
  Widget build(BuildContext context) {
    String title = catName["catName"];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: AppSize.s0,
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: _getContentwidget(context),
      ),
    );
  }

  Widget _getContentwidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getProductWidget(context),
        ],
      ),
    );
  }

  Widget _getGridProducts(List<Products> products, BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        GridView.count(
          crossAxisCount: AppSize.s_2,
          //crossAxisSpacing: AppSize.s8,
          // mainAxisSpacing: AppSize.s8,
          physics: const ScrollPhysics(),
          childAspectRatio: 1 / 1.2,
          shrinkWrap: true,
          children: List.generate(products.length, (index) {
            return InkWell(
              onTap: (() {
                Navigator.of(context).pushNamed(Routes.storeDetailsRoute);
              }),
              child: productItem(context, products[index]),
            );
          }),
        ),
      ],
    );
  }

  Widget _getProductWidget(context) {
    BlocProvider.of<CategoryProductsCubit>(context)
        .getAllProductsOfCategory(catName["catName"]);
    return BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
      builder: ((context, state) {
        if (state is CategoryProductsLoadingState) {
          return SizedBox(
            height: AppSize.s190,
            width: double.infinity,
            child: Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
              ),
            ),
          );
        } else if (state is CategoryProductsFailureState) {
          return Center(
            child: Text(state.failure.message),
          );
        } else if (state is CategoryProductsSuccessState) {
          return _getGridProducts(state.categoryProducts, context);
        } else {
          return Container();
        }
      }),
    );
  }
}
