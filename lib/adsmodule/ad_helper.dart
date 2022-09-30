import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:valo/adsmodule/shared_pref.dart';

import 'ad_banner_listener.dart';
import 'ad_interstitial_ads_listerner.dart';
import 'ad_listener.dart';
import 'ad_open_ads_listerner.dart';
import 'ad_rewarded_ads_listerner.dart';

class AdHelper {
  /**
      Banner
   **/
  static BannerAd? bannerAd;

  static void initBannerAd( AdBannerListener adBannerListener) {
    loadBannerAd(adSize: AdSize.fullBanner,adBannerListener:adBannerListener );
  }

  static void loadBannerAd({required AdSize adSize,required AdBannerListener adBannerListener}) {
    bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-2394754396430598/9007312930',
      request: const AdRequest(),
      size: adSize,
      listener: BannerAdListener(
        /// Được gọi khi gọi quảng cáo load thành công
          onAdLoaded: (_) {
            adBannerListener.onAdLoaded(_);
          },
          ///Được gọi khi load quảng cáo không thành công
          onAdFailedToLoad: (ad, err) {
            adBannerListener.onAdFailedToLoad(ad,err);
            ad.dispose();
          },
          /// Được gọi khi quảng cáo mở một lớp phủ bao phủ màn hình(khi click vào qc)
          onAdOpened: (Ad ad) {
            adBannerListener.onAdOpened(ad);
          },
          onAdClicked: (Ad ad){
            adBannerListener.onAdClicked(ad);
          },
          onAdWillDismissScreen: (Ad ad){
            adBannerListener.onAdWillDismissScreen(ad);
          },
          ///Được gọi khi quảng cáo loại bỏ lớp phủ che màn hình.(khi close qc)
          onAdClosed: (Ad ad) {
            ad.dispose();
            adBannerListener.onAdClosed(ad);
            loadBannerAd(adSize: adSize, adBannerListener: adBannerListener);
          },
          ///Được gọi khi một lần hiển thị xảy ra trên quảng cáo.
          onAdImpression: (Ad ad) {
            adBannerListener.onAdImpression(ad);
          }
      ),
    );
  }

  static void showBannerAd() {
    if (bannerAd != null) {
      bannerAd?.load();
    }
  }

  static void disposeBannerAd() {
    bannerAd?.dispose();
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  ///==========================================================================
  /**
      Intertitials
   **/
  static InterstitialAd? interstitialAd;

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/7049598008';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/3964253750';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static bool isAdsTime = false;
  static int timeDuration = 30;

  static void initIntertitials(AdInterstitialAdsListener? adInterstitialAds) {
    loadInterstitialAd(adInterstitialAds);
  }

  static void loadInterstitialAd(
      AdInterstitialAdsListener? adInterstitialAds) async {
    await InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          adInterstitialAds?.onAdLoaded(ad);
          interstitialAd = ad;
          if (isAdsTime) {
            showIntertitials();
          }
          ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (InterstitialAd ad) {
                adInterstitialAds?.onAdDismissedFullScreenContent(ad);
                ad.dispose();
                loadInterstitialAd(adInterstitialAds);
              }, onAdShowedFullScreenContent: (InterstitialAd ad) {
            adInterstitialAds?.onAdShowedFullScreenContent(ad);
          }, onAdFailedToShowFullScreenContent:
              (InterstitialAd ad, AdError error) {
            adInterstitialAds?.onAdFailedToShowFullScreenContent(ad, error);
            ad.dispose();
          }, onAdImpression: (InterstitialAd ad) {
            adInterstitialAds?.onAdImpression(ad);
          });
        },
        onAdFailedToLoad: (err) {
          adInterstitialAds?.onAdFailedToLoad(err);
        },
      ),
    );
  }

  static void showIntertitials() async {
    if (isAdsTime) {
      if (interstitialAd != null) {
        ///get lastshow ads
        var lastShowIntertitials =
        await SharedPref.getInt("last_show_intertitials");
        if (lastShowIntertitials != null) {
          ///last show ads
          var dateTimeLast =
          DateTime.fromMicrosecondsSinceEpoch(lastShowIntertitials);

          ///time now
          var currentDateTime = DateTime.now();

          ///>30 show
          var difference = currentDateTime.difference(dateTimeLast).inSeconds;
          if (difference >= timeDuration) {
            interstitialAd?.show();
          }
          log('time difference is:' '$difference');
        } else {
          log('time:last_show_intertitials null');
          interstitialAd?.show();
        }
      } else {
        log('time:_interstitialAd null');
      }
    } else {
      interstitialAd?.show();
    }
  }

  static void disposeAdIntertitials() {
    interstitialAd?.dispose();
  }

  ///==========================================================================
  /**
      Reward
   **/

  static RewardedAd? rewardedAd;

  static void initRewardedAd(AdRewardedAdsListener? adRewardedListener) {
    loadRewardedAd(adRewardedListener);
  }

  static void loadRewardedAd(AdRewardedAdsListener? adRewardedListener) async {
    await RewardedAd.load(
      adUnitId: rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        ///Load ads success
        onAdLoaded: (RewardedAd ad) {
          adRewardedListener?.onAdLoaded(ad);
          rewardedAd = ad;
          ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdShowedFullScreenContent: (RewardedAd ad) {
                adRewardedListener?.onAdShowedFullScreenContent(ad);
              }, onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
            adRewardedListener?.onAdFailedToShowFullScreenContent(ad, error);
            ad.dispose();
          }, onAdImpression: (RewardedAd ad) {
            adRewardedListener?.onAdImpression(ad);
          }, onAdDismissedFullScreenContent: (RewardedAd ad) {
            adRewardedListener?.onAdDismissedFullScreenContent(ad);
            ad.dispose();
            loadRewardedAd(adRewardedListener);
          }, onAdClicked: (RewardedAd ad) {
            adRewardedListener?.onAdClicked(ad);
          }, onAdWillDismissFullScreenContent: (RewardedAd ad) {
            adRewardedListener?.onAdWillDismissFullScreenContent();
          });
        },
        onAdFailedToLoad: (LoadAdError err) {
          adRewardedListener?.onAdFailedToLoad(err);
        },
      ),
    );
  }

  static void disposeRewardedAd() {
    rewardedAd?.dispose();
  }

  static void showRewardedAd(AdRewardedAdsListener? adRewardedListener) {
    rewardedAd?.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      adRewardedListener?.onUserEarnedReward(ad, reward);
      print('$ad with reward $RewardItem(${reward.amount}, ${reward.type}');
    });
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/8673189370';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/7552160883';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  ///==========================================================================
  /**
      Native android
   **/

  static String get nativeBannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/2247696110';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/3986624511';
    }
    throw UnsupportedError("Unsupported platform");
  }

  static NativeAd? ad;

  static void initAdNative() {
    ad = NativeAd(
      adUnitId: nativeBannerAdUnitId,
      factoryId: 'listTile',
      request: AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (_) {
          print('Ad load success');
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );
  }

  static void loadAdNative() {
    ad?.load();
  }

  static void disposeAdNative() {
    ad?.dispose();
  }

  static Widget widgetAdNavite() {
    return AdWidget(ad: ad!);
  }

  ///=============================================================================
  /**
   * APP OPEN
   *
   * **/
  static String get appOpenAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/3419835294';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/5662855259';
    }
    throw UnsupportedError("Unsupported platform");
  }

  static AppOpenAd? _appOpenAd;
  static bool _isShowingAd = false;

  /// Thời lượng tối đa cho phép từ khi tải và hiển thị quảng cáo.
  static Duration maxCacheDuration = const Duration(hours: 4);

  /// Theo dõi thời gian tải để không hiển thị những quảng cáo đã hết hạn.
  static DateTime? _appOpenLoadTime;

  /// Load an [AppOpenAd].
  static void loadAdOpen(AdOpenAdsListener adOpenAdsListerner) async {
    await AppOpenAd.load(
      adUnitId: appOpenAdUnitId,
      orientation: AppOpenAd.orientationPortrait,
      request: AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          adOpenAdsListerner.onAdLoaded(ad);
          _appOpenLoadTime = DateTime.now();
          _appOpenAd = ad;
          showAdIfAvailable(adOpenAdsListerner);
        },
        onAdFailedToLoad: (error) {
          adOpenAdsListerner.onAdFailedToLoad(error);
        },
      ),
    );
  }

  /// Whether an ad is available to be shown.
  static bool get isAdAvailable {
    return _appOpenAd != null;
  }

  static void showAdIfAvailable(AdOpenAdsListener adOpenAdsListerner) {
    if (!isAdAvailable) {
      loadAdOpen(adOpenAdsListerner);
      return;
    }
    if (_isShowingAd) {
      return;
    }
    if (DateTime.now().subtract(maxCacheDuration).isAfter(_appOpenLoadTime!)) {
      _appOpenAd!.dispose();
      _appOpenAd = null;
      loadAdOpen(adOpenAdsListerner);
      return;
    }
    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        adOpenAdsListerner.onAdShowedFullScreenContent(ad);
        _isShowingAd = true;
      },
      onAdClicked: (ad) {
        adOpenAdsListerner.onAdClicked(ad);
      },
      onAdImpression: (ad) {
        adOpenAdsListerner.onAdImpression(ad);
      },
      onAdWillDismissFullScreenContent: (ad) {
        adOpenAdsListerner.onAdWillDismissFullScreenContent(ad);
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        adOpenAdsListerner.onAdFailedToShowFullScreenContent(ad, error);
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        adOpenAdsListerner.onAdDismissedFullScreenContent(ad);
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        // loadAdOpen(adOpenAdsListerner);
      },
    );
    _appOpenAd!.show();
  }
}