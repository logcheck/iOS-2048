//
//  F3HBridgeModule.h
//  NumberTileGame
//
//  Created by Michael Prouty on 10/31/19.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

NS_ASSUME_NONNULL_BEGIN

@interface F3HBridgeModule : NSObject <RCTBridgeModule>
+ (UIViewController*)getMenuViewController;
+ (void)setMenuViewController:(UIViewController*)viewController;
@end

NS_ASSUME_NONNULL_END
