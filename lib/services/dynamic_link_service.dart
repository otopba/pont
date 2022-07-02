import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:pont/utils/logs/log.dart';

const _tag = 'dynamic_link_service';

class DynamicLinkService {
  late final StreamSubscription _subscription;

  DynamicLinkService() {
    _init();
  }

  Future<void> _init() async {
    Log.d(_tag, '_init');

    _subscription = FirebaseDynamicLinks.instance.onLink.listen(_onLink);
    await FirebaseDynamicLinks.instance.getInitialLink().then(_onInitialLink);
  }

  void dispose() {
    Log.d(_tag, 'dispose');

    _subscription.cancel();
  }

  void _onInitialLink(PendingDynamicLinkData? linkData) {
    Log.d(_tag, '_onInitialLink: linkData = $linkData');
  }

  void _onLink(PendingDynamicLinkData linkData) {
    Log.d(_tag, '_onLink: linkData = $linkData');

    Log.d(_tag, '_onLink: ${linkData.link.queryParameters}}');
  }
}
