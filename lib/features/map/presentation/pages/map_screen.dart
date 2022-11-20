import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:valo/features/map/domain/entities/map.dart';
import 'package:valo/features/map/presentation/cubit/maps_cubit.dart';
import 'package:valo/features/map/presentation/widgets/list_maps.dart';

import '../../../../adsmodule/ad_banner_listener.dart';
import '../../../../adsmodule/ad_helper.dart';
import '../../../../constants/app_colors.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen>  implements AdBannerListener {
  @override
  void initState() {
    AdHelper.initBannerAd(this);
    AdHelper.loadBannerAd(adSize: AdSize.fullBanner, adBannerListener: this);
    AdHelper.showBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      minimum: EdgeInsets.only(top: 50.h),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Maps',
              style: TextStyle(
                  color: white, fontFamily: 'Valorant', fontSize: 20.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            const ListMaps(),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: AdHelper.bannerAd?.size.width.toDouble(),
                  height: AdHelper.bannerAd?.size.height.toDouble(),
                  child: Container(

                    ///Để hiển thị qc như một widget dùng AdWidget sau khi gọi [load]
                    child: AdWidget(ad: AdHelper.bannerAd!),
                  )
              ),
            )
          ],
        ),
      ),
    ));
  }

  @override
  void onAdClicked(Ad ad) {
    // TODO: implement onAdClicked
  }

  @override
  void onAdClosed(Ad ad) {
    // TODO: implement onAdClosed
  }

  @override
  void onAdFailedToLoad(Ad ad, LoadAdError error) {
    // TODO: implement onAdFailedToLoad
  }

  @override
  void onAdImpression(Ad ad) {
    // TODO: implement onAdImpression
  }

  @override
  void onAdLoaded(Ad ad) {
    // TODO: implement onAdLoaded
  }

  @override
  void onAdOpened(Ad ad) {
    // TODO: implement onAdOpened
  }

  @override
  void onAdWillDismissScreen(Ad ad) {
    // TODO: implement onAdWillDismissScreen
  }
}




