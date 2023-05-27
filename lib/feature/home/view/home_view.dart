import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:localization/localization.dart';
import 'package:sample_article_flutter/core/constant/value_constants.dart';
import 'package:sample_article_flutter/core/style/app_color.dart';
import 'package:sample_article_flutter/core/util/general_utils.dart';
import 'package:sample_article_flutter/start/app_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _locationText = "";

  @override
  void initState() {
    checkLocationService();
    _checkIsLocationEnable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        24.ph,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
          child: "search".i18n().boldText(
                fontSize: 14.sp,
              ),
        ),
        Divider(
          height: 1.h,
          color: AppColor.commonGray,
        ),
        _itemEntryView(
          title: "searchArticle".i18n(),
          onClicked: () {
            AutoRouter.of(context).push(
              const SearchRoute(),
            );
          },
        ),
        36.ph,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
          child: "popular".i18n().boldText(
                fontSize: 14.sp,
              ),
        ),
        Divider(
          height: 1.h,
          color: AppColor.commonGray,
        ),
        _itemEntryView(
          title: "mostViewed".i18n(),
          onClicked: () {
            AutoRouter.of(context).push(
              ArticleListRoute(
                listType: ValueConstants.mostViewedListType,
              ),
            );
          },
        ),
        24.ph,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
          child: _locationText.mediumText(),
        ),
      ],
    );
  }

  Widget _itemEntryView({
    required String title,
    required Function() onClicked,
  }) {
    return GestureDetector(
      onTap: onClicked,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
            child: Row(
              children: [
                title.mediumText(
                  fontSize: 14.sp,
                ),
                const Spacer(),
                SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: const Icon(
                    Icons.chevron_right,
                    color: AppColor.commonBlack,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.h,
            color: AppColor.commonGray,
          ),
        ],
      ),
    );
  }

  void _checkIsLocationEnable() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (isLocationServiceEnabled) {
      _startLocationStream();
    }

    StreamSubscription<ServiceStatus> serviceStatusStream = Geolocator.getServiceStatusStream().listen(
      (ServiceStatus status) {
        if (status == ServiceStatus.enabled) {
          _startLocationStream();
          GeneralUtils.showGeneralToast("locationEnabledMsg".i18n());
        } else {
          GeneralUtils.showGeneralToast("locationDisabledMsg".i18n());
        }
      },
    );
  }

  void _startLocationStream() async {
    late LocationSettings locationSettings;

    if (Platform.isAndroid) {
      locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
        forceLocationManager: true,
        intervalDuration: const Duration(seconds: 10),
        //(Optional) Set foreground notification config to keep the app alive
        //when going to the background
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationText: "Example app will continue to receive your location even when you aren't using it",
          notificationTitle: "Running in Background",
          enableWakeLock: true,
        ),
      );
    } else if (Platform.isIOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
    }

    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
      (Position? position) {
        if (position != null) {
          setState(() {
            _locationText = "Current position: ${position.latitude.toString()}, ${position.longitude.toString()}";
          });
        }
      },
    );
  }
}
