

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class FlutterWebViewVM extends BaseViewModel {
  WebViewController controller = WebViewController();
  bool isLoading = true;
  bool isInternetOn = true;

  FlutterWebViewVM() {
    initializeWebView();
  }

  Future<void> initializeWebView() async {
    try {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (String url) {
              debugPrint('Page started loading: $url');
              isLoading = true;
              notifyListeners();
            },
            onPageFinished: (String url) {
              debugPrint('Page finished loading: $url');
              isLoading = false;
              notifyListeners();
            },
            onHttpError: (HttpResponseError error) {
              debugPrint("************ HttpResponseError ************");

              isLoading = true;
              notifyListeners();
            },

            onWebResourceError: (WebResourceError error) {
              debugPrint("************ WebResourceError ************");
              debugPrint("************ error : ${error} ************");
              // q// notifyListeners();
            },
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse('https://abdullahiftikhar.site/'));
    } catch (e, stacktrace) {
      isLoading = true;
      notifyListeners();
    }
  }
}