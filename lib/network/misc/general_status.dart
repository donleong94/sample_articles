import 'package:equatable/equatable.dart';

/// General status used after calling API, has pre-defined status
/// Can use custom-defined status
class GeneralStatus extends Equatable {
  static const int _initVal = -1;
  static const int _loadingVal = 0;
  static const int _successVal = 1;
  static const int _errorVal = 2;

  final int statusVal;

  const GeneralStatus(this.statusVal);

  // Default status

  static const GeneralStatus init = GeneralStatus(_initVal);

  static const GeneralStatus loading = GeneralStatus(_loadingVal);

  static const GeneralStatus success = GeneralStatus(_successVal);

  static const GeneralStatus error = GeneralStatus(_errorVal);

  // Check status

  bool isInit() => statusVal == _initVal;

  bool isLoading() => statusVal == _loadingVal;

  bool isSuccess() => statusVal == _successVal;

  bool isError() => statusVal == _errorVal;

  @override
  List<Object?> get props {
    return [
      statusVal,
    ];
  }
}
