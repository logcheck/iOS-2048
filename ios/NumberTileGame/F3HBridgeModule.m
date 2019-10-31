//
//  F3HBridgeModule.m
//  NumberTileGame
//
//  Created by Michael Prouty on 10/31/19.
//

#import "F3HBridgeModule.h"

static UIViewController *menuViewController;

@implementation F3HBridgeModule

+ (UIViewController*)getMenuViewController {
    return menuViewController;
}

+ (void)setMenuViewController:(UIViewController*)viewController {
    menuViewController = viewController;
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(exitHighScoreButtonTapped) {
    NSLog(@"exitHighScoreButtonTapped called!");
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController* vc = [self.class getMenuViewController];
        [vc dismissViewControllerAnimated:YES completion:nil];
    });
}

@end
