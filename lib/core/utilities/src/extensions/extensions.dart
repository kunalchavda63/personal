import 'dart:io';

enum PlatformType { android, ios, windows, linux, macos, fuchsia }

bool get isAndroid => Platform.isAndroid;

bool get isIos => Platform.isIOS;

bool get isWindows => Platform.isWindows;

bool get isLinux => Platform.isLinux;

bool get isMacOs => Platform.isMacOS;

bool get isFuchsia => Platform.isFuchsia;

// extension AppLinkLauncher on AppLinkModel {
//   Future<void> launch({bool forceStoreFallback = false}) async {
//     final Uri appUri = Uri.parse(appUrl);
//     final Uri storeUri = Uri.parse(storeUrl);
//     try {
//       if (!forceStoreFallback && await canLaunchUrl(appUri)) {
//         final success = await launchUrl(
//           appUri,
//           mode: LaunchMode.externalApplication,
//         );
//         if (success) return;
//       }
//     } catch (e) {
//       debugPrint("App launch failed: $e");
//     }
//
//     // fallback to store
//     if (await canLaunchUrl(storeUri)) {
//       await launchUrl(storeUri, mode: LaunchMode.externalApplication);
//     } else {
//       Exception('Could not launch app or store link.');
//     }
//   }
// }
