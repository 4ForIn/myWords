import 'package:firebase_remote_config/firebase_remote_config.dart';

Future<RemoteConfig> setupRemoteConfig() async {
  try {
    final RemoteConfig remoteConfig = await RemoteConfig.instance;
    // Enable developer mode to relax fetch throttling
    remoteConfig.setConfigSettings(RemoteConfigSettings(debugMode: true));
    await remoteConfig.fetch(expiration: const Duration(hours: 1));
    await remoteConfig.activateFetched();
    return remoteConfig;
  } on FetchThrottledException catch (exception) {
    // Fetch throttled.
    // ignore: avoid_print
    print('Remote config fetch throttled: $exception');
  } catch (exception) {
    // ignore: avoid_print
    print('Unable to fetch remote config. Cached or default values will be '
        'used');
  }
  return null;
}
