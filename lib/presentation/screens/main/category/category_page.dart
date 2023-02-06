import 'package:elsheikh_store/presentation/business_logic/cubit/category_cubit/category_page_cubit.dart';
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
            return SizedBox(
              height: AppSize.s190,
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primary,
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

  Widget _getCategoryWidget(List<String> categories) {
    return Column(
      children: List.generate(categories.length, (index) {
        return Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.2,
              color: ColorManager.primary,
            ),
          ),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                categories[index],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              )),
        );
      }),
    );
  }
}
