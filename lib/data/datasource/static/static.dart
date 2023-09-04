import 'package:store/core/constant/images_asset.dart';
import 'package:store/data/model/onboardingmodel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: 'Choose Product',
      image: AppImagesAsset.chooseProductImg,
      body:
          "We Have a 100k + products. Choose\n Your product from our\n E-commerce shop."),
  OnBoardingModel(
      title: 'Easy & Safe Payment',
      image: AppImagesAsset.qrImg,
      body:
          "Easy Cheakout & Safe payment\n method. Trusted by our Customers \n from all over the world."),
  OnBoardingModel(
      title: 'Track Your Order',
      image: AppImagesAsset.trackurorderImg,
      body:
          "Best Tracker has been Used For\n Track your order.You'll know where\n your product is at the moment"),OnBoardingModel(
      title: 'Fast Delivery',
      image: AppImagesAsset.fastImg,
      body:
          "Reline And Fast Delivery.We\nDeliver your product the fastest\n way possible"),
];
