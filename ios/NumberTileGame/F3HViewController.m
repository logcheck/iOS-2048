//
//  F3HViewController.m
//  NumberTileGame
//
//  Created by Austin Zheng on 3/22/14.
//
//

#import <React/RCTRootView.h>

#import "F3HViewController.h"

#import "F3HNumberTileGameViewController.h"

@interface F3HViewController ()
@end

@implementation F3HViewController

- (IBAction)playGameButtonTapped:(id)sender {
    F3HNumberTileGameViewController *c = [F3HNumberTileGameViewController numberTileGameWithDimension:4
                                                                                         winThreshold:2048
                                                                                      backgroundColor:[UIColor whiteColor]
                                                                                          scoreModule:YES
                                                                                       buttonControls:NO
                                                                                        swipeControls:YES];
    c.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:c animated:YES completion:nil];
}

- (IBAction)highScoreButtonPressed:(id)sender {
    NSLog(@"High Score Button Pressed");
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];

    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                moduleName: @"RNHighScores"
                         initialProperties:@{@"scores" : @[
                                                     @{
                                                         @"name" : @"Alex",
                                                         @"value": @"42"
                                                         },
                                                     @{
                                                         @"name" : @"Joel",
                                                         @"value": @"10"
                                                         }
                                                     ]
                                             }
                             launchOptions: nil];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view = rootView;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
