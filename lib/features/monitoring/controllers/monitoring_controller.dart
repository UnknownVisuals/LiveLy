import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lively/features/monitoring/models/monitoring_model.dart';
import 'package:lively/utils/popups/snackbar.dart';

class MonitoringController extends GetxController {
  final Rx<MonitoringModel> data = MonitoringModel().obs;
  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;

  final DatabaseReference _ref = FirebaseDatabase.instance.ref(
    'tekanan_darah/latest',
  );
  StreamSubscription<DatabaseEvent>? _subscription;

  List<Map<String, dynamic>> get cards => [
    {
      'icon': Iconsax.activity,
      'value': data.value.heartRateString,
      'unit': 'bpm',
      'label': 'Heart Rate',
    },
    {
      'icon': Iconsax.heart_circle,
      'value': data.value.bloodPressure,
      'unit': 'mmHg',
      'label': 'Blood Pressure',
    },
    {
      'icon': Iconsax.cloud,
      'value': data.value.oxygenSaturationString,
      'unit': '%',
      'label': 'Oxygen',
    },
    {
      'icon': Iconsax.sun,
      'value': data.value.temperatureString,
      'unit': '°C',
      'label': 'Temperature',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    _startListening();
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  void refreshData() {
    isLoading.value = true;
    error.value = '';
    _subscription?.cancel();
    _startListening();
  }

  void _startListening() {
    _subscription = _ref.onValue.listen(
      (event) {
        if (event.snapshot.exists) {
          final json = Map<String, dynamic>.from(event.snapshot.value as Map);
          data.value = MonitoringModel.fromJson(json);
          isLoading.value = false;
          error.value = '';

          checkVitals(
            Get.context!,
            data.value.temperature ?? 0,
            data.value.heartRate?.toInt() ?? 0,
            data.value.oxygenSaturation?.toInt() ?? 0,
            data.value.systolicBP?.toInt() ?? 0,
            data.value.diastolicBP?.toInt() ?? 0,
          );
        } else {
          error.value = 'No data found';
          isLoading.value = false;
          REYLoaders.warningSnackBar(
            title: 'Warning',
            message: 'No monitoring data found.',
          );
        }
      },
      onError: (error) {
        this.error.value = error.toString();
        isLoading.value = false;
        REYLoaders.errorSnackBar(
          title: 'Error',
          message: 'Failed to load monitoring data.',
        );
      },
    );
  }

  void checkVitals(
    BuildContext context,
    double temperature,
    int heartRate,
    int oxygenSaturation,
    int systolicBP,
    int diastolicBP,
  ) {
    if (temperature > 37.5 ||
        heartRate > 100 ||
        oxygenSaturation < 95 ||
        systolicBP > 130 ||
        diastolicBP > 90) {
      REYLoaders.warningSnackBar(
        title: 'Warning',
        message: 'Abnormal vital signs detected!',
      );
    }
  }
}
