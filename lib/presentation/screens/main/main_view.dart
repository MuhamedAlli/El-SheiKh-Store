import 'package:elsheikh_store/app/constants.dart';
import 'package:elsheikh_store/presentation/business_logic/cubit/cart_cubit/cart_cubit.dart';
import 'package:elsheikh_store/presentation/resources/color_manager.dart';
import 'package:elsheikh_store/presentation/resources/strings_manager.dart';
import 'package:elsheikh_store/presentation/resources/values_manager.dart';
import 'package:elsheikh_store/presentation/screens/main/cart/cart_page.dart';
import 'package:elsheikh_store/presentation/screens/main/category/category_page.dart';
import 'package:elsheikh_store/presentation/screens/main/home/home_page.dart';
import 'package:elsheikh_store/presentation/screens/main/profile/profile_page.dart';
import 'package:elsheikh_store/presentation/screens/main/white_list/white_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/dependancy_injection.dart';
import '../../business_logic/cubit/category_cubit/category_page_cubit.dart';
import '../../business_logic/cubit/home_cubit/home_page_cubit.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    BlocProvider(
      create: (context) => instance<HomePageCubit>(),
      child: const HomePage(),
    ),
    BlocProvider(
      create: (context) => instance<CategoryPageCubit>(),
      child: const CategoryPage(),
    ),
    const WhiteListPage(),
    BlocProvider(
      create: (context) => instance<CartCubit>(),
      child: const CartPage(),
    ),
    const ProfilePage()
  ];
  List<String> titles = [
    AppStrings.home,
    AppStrings.category,
    AppStrings.whiteList,
    AppStrings.cart,
    AppStrings.setting
  ];

  var _title = AppStrings.home;

  var _currentIndex = Constants.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: ColorManager.white,
        elevation: Constants.doubleZero,
        leadingWidth: Constants.doubleZero,
        title: Text(
          _title,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 20,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 25,
            ),
          ),
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: ColorManager.lightGrey, spreadRadius: AppSize.s0_5)
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.grey,
          currentIndex: _currentIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: AppStrings.home),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                label: AppStrings.category),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: AppStrings.whiteList),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: AppStrings.cart),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: AppStrings.setting),
          ],
        ),
      ),
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
