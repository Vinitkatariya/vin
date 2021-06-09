//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<animated_theme_switcher/AnimatedThemeSwitcherPlugin.h>)
#import <animated_theme_switcher/AnimatedThemeSwitcherPlugin.h>
#else
@import animated_theme_switcher;
#endif

#if __has_include(<camera/CameraPlugin.h>)
#import <camera/CameraPlugin.h>
#else
@import camera;
#endif

#if __has_include(<flutter_facebook_login/FacebookLoginPlugin.h>)
#import <flutter_facebook_login/FacebookLoginPlugin.h>
#else
@import flutter_facebook_login;
#endif

#if __has_include(<flutter_native_image/FlutterNativeImagePlugin.h>)
#import <flutter_native_image/FlutterNativeImagePlugin.h>
#else
@import flutter_native_image;
#endif

#if __has_include(<flutter_secure_storage/FlutterSecureStoragePlugin.h>)
#import <flutter_secure_storage/FlutterSecureStoragePlugin.h>
#else
@import flutter_secure_storage;
#endif

#if __has_include(<image_cropper/FLTImageCropperPlugin.h>)
#import <image_cropper/FLTImageCropperPlugin.h>
#else
@import image_cropper;
#endif

#if __has_include(<image_editor/FlutterImageEditorPlugin.h>)
#import <image_editor/FlutterImageEditorPlugin.h>
#else
@import image_editor;
#endif

#if __has_include(<image_picker/FLTImagePickerPlugin.h>)
#import <image_picker/FLTImagePickerPlugin.h>
#else
@import image_picker;
#endif

#if __has_include(<path_provider/FLTPathProviderPlugin.h>)
#import <path_provider/FLTPathProviderPlugin.h>
#else
@import path_provider;
#endif

#if __has_include(<photo_manager/ImageScannerPlugin.h>)
#import <photo_manager/ImageScannerPlugin.h>
#else
@import photo_manager;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AnimatedThemeSwitcherPlugin registerWithRegistrar:[registry registrarForPlugin:@"AnimatedThemeSwitcherPlugin"]];
  [CameraPlugin registerWithRegistrar:[registry registrarForPlugin:@"CameraPlugin"]];
  [FacebookLoginPlugin registerWithRegistrar:[registry registrarForPlugin:@"FacebookLoginPlugin"]];
  [FlutterNativeImagePlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterNativeImagePlugin"]];
  [FlutterSecureStoragePlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterSecureStoragePlugin"]];
  [FLTImageCropperPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImageCropperPlugin"]];
  [FlutterImageEditorPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterImageEditorPlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [ImageScannerPlugin registerWithRegistrar:[registry registrarForPlugin:@"ImageScannerPlugin"]];
}

@end
