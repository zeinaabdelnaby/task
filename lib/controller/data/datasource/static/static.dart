import 'package:flutter/material.dart';
import 'package:task/core/constants/image_asset.dart';
import 'package:task/models/onboarding_model.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "الفيزياء بطريقة جديدة و ممتعة",
      body: "أفضل نظام متابعة من متخصصين \n معاك لحظة بلحظة",
      image: AppImageAsset.onBoardingImageTwo),
  OnBoardingModel(
      title: "اشترك و احصل على المراجعات",
      body: "ادخل كود الاشتراك، وابدأ \n رحلتك التعليمية",
      image: AppImageAsset.onBoardingImageThree),
  OnBoardingModel(
      title: "مرحبا بك عزيزي الطالب",
      body: "هنساعدك تتعلم الفيزياء بطريقة \n سهلة و مبسطة",
      image: AppImageAsset.onBoardingImageFour),
];

final images = [
    const AssetImage(
        AppImageAsset.homeImageOne),
    const AssetImage(
        AppImageAsset.homeImageTwo),
    const AssetImage(
        AppImageAsset.homeImageThree),
        const AssetImage(
        AppImageAsset.homeImageFour),
        const AssetImage(
        AppImageAsset.homeImageFive),
  ];
