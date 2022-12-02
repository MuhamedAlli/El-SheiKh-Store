import '../../../domain/model/models.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/constants_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/routes_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  List<SliderObject> getDataOfSliderObject() {
    return [
      SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1,
          ImageAssets.onboarding1),
      SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2,
          ImageAssets.onboarding2),
      SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3,
          ImageAssets.onboarding3),
    ];
  }

  late List<SliderObject> _list;

  int currentIndex = 0;
  @override
  void initState() {
    _list = getDataOfSliderObject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.offWhite,
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: ((context, index) {
          //print(state.listSliderObject[1].title);
          return OnBoardingPage(_list[index]);
        }),
      ),
      bottomSheet: Container(
        color: ColorManager.offWhite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: (() {
                  Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
                }),
                child: Text(
                  AppStrings.skip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //left Arrow
        GestureDetector(
          onTap: () {
            _pageController.animateToPage(_goPrevius(),
                duration: const Duration(
                    milliseconds: AppConstants.sliderAnimationTime),
                curve: Curves.bounceInOut);
          },
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p18),
            child: SizedBox(
              height: AppSize.s30,
              width: AppSize.s30,
              child: SvgPicture.asset(
                ImageAssets.leftArrowIc,
                color: ColorManager.primary,
              ),
            ),
          ),
        ),

        //circle indicator
        Row(
          children: [
            for (int i = 0; i < _list.length; i++)
              Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i))
          ],
        ),

        //right Arrow
        GestureDetector(
          onTap: () {
            _pageController.animateToPage(_goNext(),
                duration: const Duration(
                    milliseconds: AppConstants.sliderAnimationTime),
                curve: Curves.bounceInOut);
          },
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p18),
            child: SizedBox(
              height: AppSize.s30,
              width: AppSize.s30,
              child: SvgPicture.asset(
                ImageAssets.rightArrowIc,
                color: ColorManager.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  int _goNext() {
    int nextIndex = ++currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = AppConstants.zero;
    }
    return nextIndex;
  }

  int _goPrevius() {
    int previusIndex = --currentIndex;
    if (previusIndex < AppConstants.zero) {
      previusIndex = _list.length - 1;
    }
    return previusIndex;
  }

  Widget _getProperCircle(int index) {
    if (index == currentIndex) {
      return SizedBox(
        height: AppSize.s10,
        width: AppSize.s10,
        child: SvgPicture.asset(
          ImageAssets.solidCirlceIc,
          color: ColorManager.primary,
        ),
      );
    } else {
      return SizedBox(
        height: AppSize.s10,
        width: AppSize.s10,
        child: SvgPicture.asset(
          ImageAssets.hollowCirlceIc,
          color: ColorManager.primary,
        ),
      );
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(_sliderObject.image),
          const SizedBox(
            height: AppSize.s16,
          ),
          Text(
            _sliderObject.title,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          Text(
            _sliderObject.subTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
