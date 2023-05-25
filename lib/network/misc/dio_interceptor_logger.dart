import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sample_article_flutter/core/util/type_short.dart';

final dioInterceptorLogger = InterceptorsWrapper(
  onRequest: (RequestOptions options, handler) {
    var encoder = const JsonEncoder.withIndent("  ");
    var headerStr = "";
    var dataPrettyJson = "";

    if (options.data is Hmap) {
      var dataJmap = options.data as Hmap?;
      var dataStr = dataJmap != null ? encoder.convert(dataJmap) : "";
      dataPrettyJson = dataStr.replaceAll("\n", "\n| ");
    } else {
      dataPrettyJson = options.data?.toString() ?? "";
    }

    options.headers.forEach((key, value) {
      if (headerStr.isEmpty) {
        headerStr += "$key: $value";
      } else {
        headerStr += "\n| $key: $value";
      }
    });

    debugPrint("┌----------------------------------------------------------------------------------------");
    debugPrint("| REQUEST");
    debugPrint("| ${options.method} ${options.uri}");
    debugPrint("|");
    debugPrint("| Headers:");
    debugPrint("| $headerStr");
    debugPrint("|");
    debugPrint("| Data:");
    debugPrint("| $dataPrettyJson");
    debugPrint("└----------------------------------------------------------------------------------------");

    handler.next(options);
  },
  onResponse: (Response response, handler) async {
    var encoder = const JsonEncoder.withIndent("  ");
    var tempData = response.data;
    var dataPrettyJson = "";

    if (tempData is Hmap) {
      var dataJmap = response.data as Hmap?;
      var dataStr = dataJmap != null ? encoder.convert(dataJmap) : "";
      dataPrettyJson = dataStr.replaceAll("\n", "\n| ");
    } else {
      dataPrettyJson = tempData.toString();
    }

    debugPrint("┌----------------------------------------------------------------------------------------");
    debugPrint("| RESPONSE [code ${response.statusCode}]");
    debugPrint("|");
    debugPrint("| Data:");
    debugPrint("| $dataPrettyJson");
    debugPrint("└----------------------------------------------------------------------------------------");

    handler.next(response);
  },
  onError: (DioError error, handler) async {
    debugPrint("┌----------------------------------------------------------------------------------------");
    debugPrint("| ERROR ${error.error}");
    debugPrint("|");
    debugPrint("| ${error.response.toString()}");
    debugPrint("└----------------------------------------------------------------------------------------");

    handler.next(error);
  },
);
