//
//  HighScoreArchiver.m
//  NumberTileGame
//
//  Created by Michael Prouty on 10/30/19.
//

#import "HighScoreArchiver.h"
static NSString *const highScoreArchivePath = @"highScoreArchive";

@implementation HighScoreArchiver

+ (NSString*)filePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *path = [documentsDirectoryPath stringByAppendingPathComponent:highScoreArchivePath];
    // NSLog(@"File path: %@", path);
    return path;
}

+ (BOOL)writeScore:(NSNumber*)score {
    //NSLog(@"value passed to archiver: %@", score);
    return [NSKeyedArchiver archiveRootObject:score toFile:self.filePath];
}

+ (NSNumber*)readScore {
    NSNumber *score = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
    //  NSLog(@"value returned from archiver: %@", score);
    return score;
}

@end
