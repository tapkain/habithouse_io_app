class DeepLinkPayload {
  DeepLinkPayload({required this.launchUrl});

  final String launchUrl;
}

// TODO: this is a POC of deep linking, further thinking required
abstract class DeepLinkDelegate {
  Future<DeepLinkPayload?> fetchDeepLink();
}
