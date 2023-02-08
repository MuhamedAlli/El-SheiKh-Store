import 'package:carousel_slider/carousel_slider.dart';
import 'package:elsheikh_store/presentation/screens/main/home/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/model/models.dart';
import '../../../business_logic/cubit/home_cubit/home_page_cubit.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<HomePageCubit>(context).getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _getContentwidget(),
    );
  }

  Widget _getContentwidget() {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getBannersCarousel(),
          _getSection("New Products"),
          _getProductWidget(),
        ],
      ),
    );
  }

  Widget _getProductWidget() {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: ((context, state) {
        if (state is HomePageInitial) {
          return SizedBox(
            height: AppSize.s190,
            width: double.infinity,
            child: Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
              ),
            ),
          );
        } else if (state is FailureHomePage) {
          return Center(
            child: Text(state.failure.message),
          );
        } else if (state is LoadedHomePage) {
          return _getGridProducts(state.products);
        } else {
          return Container();
        }
      }),
    );
  }

  Widget _getGridProducts(List<Products> products) {
    return Flex(
      direction: Axis.vertical,
      children: [
        GridView.count(
          crossAxisCount: AppSize.s_2,
          //crossAxisSpacing: AppSize.s8,
          // mainAxisSpacing: AppSize.s8,
          childAspectRatio: 1 / 1.2,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          children: List.generate(products.length, (index) {
            return InkWell(
              onTap: (() {
                //Navigator.of(context).pushNamed(Routes.storeDetailsRoute);
              }),
              child: productItem(context, products[index]),
            );
          }),
        ),
      ],
    );
  }

  Widget _getSection(String section) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Text(
        section,
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontSize: 22,
            ),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _getBannersCarousel() {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: ((context, state) {
        if (state is HomePageInitial) {
          return SizedBox(
            height: AppSize.s190,
            width: double.infinity,
            child: Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
              ),
            ),
          );
        } else if (state is FailureHomePage) {
          return Center(
            child: Text(state.failure.message),
          );
        } else if (state is LoadedHomePage) {
          return _getBannerWidget(state.products);
        } else {
          return Container();
        }
      }),
    );
  }

  Widget _getBannerWidget(List<Products> productsBanner) {
    return CarouselSlider(
      items: productsBanner
          .map(
            (banner) => SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppSize.s12,
                ),
                child: Image.network(
                  banner.image,
                  //fit: BoxFit.cover,
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: AppSize.s190,
        initialPage: 0,
        viewportFraction: 1.0,
        autoPlay: true,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
      ),
    );
  }

  /*Widget _getCategoryWidget() {
    return BlocBuilder<HomePageCubit, HomePageState>(
        builder: ((context, state) {
      if (state is HomePageInitial) {
        return SizedBox(
          height: AppSize.s190,
          width: double.infinity,
          child: Center(
            child: CircularProgressIndicator(
              color: ColorManager.primary,
            ),
          ),
        );
      } else if (state is FailureHomePage) {
        return Center(
          child: Text(state.failure.message),
        );
      } else if (state is LoadedHomePage) {
        return _getCategoryItems(state.products);
      } else {
        return Container();
      }
    }));
  }*/

  /* Widget _getCategoryItems(List<Products> products) {
    return Container(
      height: AppSize.s140,
      margin: const EdgeInsets.symmetric(vertical: AppSize.s12),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: products
            .map(
              (product) => Card(
                elevation: AppSize.s4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  side: BorderSide(
                      color: ColorManager.lightGrey, width: AppSize.s1),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                      child: Image.network(
                        product.image,
                        fit: BoxFit.cover,
                        width: AppSize.s100,
                        height: AppSize.s100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: AppSize.s8),
                      child: SizedBox(
                        width: 140,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              product.title,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }*/

  @override
  void dispose() {
    super.dispose();
  }
}
