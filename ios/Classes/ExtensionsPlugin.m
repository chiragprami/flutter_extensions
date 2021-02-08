#import "ExtensionsPlugin.h"
#if __has_include(<extensions/extensions-Swift.h>)
#import <extensions/extensions-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "extensions-Swift.h"
#endif

@implementation ExtensionsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftExtensionsPlugin registerWithRegistrar:registrar];
}
@end
