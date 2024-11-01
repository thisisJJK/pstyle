import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdMobService {
  InterstitialAd? _interstitialAd;
  DateTime? _lastAdTime; // 마지막 광고가 표시된 시간

  Future<void> configureAdSettings() async {
    if (Platform.isIOS) {
      var trackingStatus =
          await AppTrackingTransparency.trackingAuthorizationStatus;

      // 처음 실행 시 권한 요청
      if (trackingStatus == TrackingStatus.notDetermined) {
        trackingStatus =
            await AppTrackingTransparency.requestTrackingAuthorization();
      }

      // 개인화 여부에 따라 광고 요청 설정
      if (trackingStatus == TrackingStatus.authorized) {
        MobileAds.instance.updateRequestConfiguration(
          RequestConfiguration(
            tagForChildDirectedTreatment:
                TagForChildDirectedTreatment.unspecified,
            maxAdContentRating: MaxAdContentRating.g,
          ),
        );
      } else {
        MobileAds.instance.updateRequestConfiguration(
          RequestConfiguration(
            tagForChildDirectedTreatment: TagForChildDirectedTreatment.no,
            maxAdContentRating: MaxAdContentRating.g,
          ),
        );
      }
    }
    await loadLastAdTime();
    loadInterstitialAd(); // 전면 광고 로드
  }

  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/4411468910', // 실제 전면 광고 ID로 교체
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;

          print('전면 광고 로드 성공');
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('전면 광고 로드 실패: $error');

          _interstitialAd = null;
        },
      ),
    );
  }

  void showInterstitialAdIfNeeded() async {
    final currentTime = DateTime.now();

    if (_lastAdTime == null ||
        currentTime.difference(_lastAdTime!).inMinutes >= 15) {
      if (_interstitialAd == null) {
        print('전면 광고가 아직 로드되지 않음, 광고 로드 시작');
        loadInterstitialAd();

        // 광고 로드될 때까지 대기
        await Future.delayed(const Duration(seconds: 2)); // 최대 기다림 시간 설정
      }

      // 로드된 광고가 있으면 표시
      if (_interstitialAd != null) {
        showInterstitialAd();
        _lastAdTime = currentTime;
        saveLastAdTime();
      } else {
        print('광고를 로드할 수 없음');
      }
    } else {
      print("시간 이내에 광고가 표시되지 않음");
    }
  }

  // 마지막 광고 시간을 로컬 저장소에서 불러오기
  Future<void> loadLastAdTime() async {
    final prefs = await SharedPreferences.getInstance();
    final lastAdTimeMillis = prefs.getInt('lastAdTime');
    if (lastAdTimeMillis != null) {
      _lastAdTime = DateTime.fromMillisecondsSinceEpoch(lastAdTimeMillis);
    }
  }

  // 마지막 광고 시간을 로컬 저장소에 저장
  Future<void> saveLastAdTime() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastAdTime', _lastAdTime!.millisecondsSinceEpoch);
  }

  void showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          loadInterstitialAd(); // 광고가 닫힌 후 새로운 광고 로드
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          loadInterstitialAd();
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null; // 광고를 한 번만 보여주도록 초기화
    } else {
      print('전면 광고가 로드되지 않음');
      loadInterstitialAd();
    }
  }
}
