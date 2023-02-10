import 'package:elsheikh_store/presentation/business_logic/cubit/category_cubit/category_page_cubit.dart';
import 'package:elsheikh_store/presentation/resources/assets_manager.dart';
import 'package:elsheikh_store/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    BlocProvider.of<CategoryPageCubit>(context).getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<CategoryPageCubit, CategoryPageState>(
        builder: (context, state) {
          if (state is CategoryPageInitial) {
            return Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                ),
              ),
            );
          } else if (state is FailureCategoryPage) {
            return Center(
              child: Text(state.failure.message),
            );
          } else if (state is LoadedCategoryPage) {
            return _getCategoryWidget(state.categories);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  List<String> categoryImages = [
    ImageAssets.electricImage,
    ImageAssets.jewelryImage,
    ImageAssets.menImage,
    ImageAssets.womenImage,
  ];
  Widget _getCategoryWidget(List<String> categories) {
    categories.sort();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        categories.length,
        (index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.categoryProductsRoute,
                arguments: {"catName": categories[index]},
              );
            },
            child: Container(
              margin: const EdgeInsets.all(AppMargin.m10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 1,
                  color: Colors.grey[300]!,
                ),
                color: Colors.grey[200],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    categoryImages[index],
                    fit: BoxFit.cover,
                    width: 180,
                    height: 150,
                  ),
                  Text(
                    categories[index],
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 18,
                        ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 25,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
