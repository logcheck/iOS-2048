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

+ (void)addScore:(NSNumber*)value {
    NSLog(@"new score added of: %@", value);

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];

    NSDictionary *score = @{
                                 @"value" : value,
                                 @"createdAt" : dateString
                           };
    NSArray* scores = self.readScores;
    scores = [scores arrayByAddingObject:score];

    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"value"
                                        ascending:NO];
    
    scores = [scores sortedArrayUsingDescriptors:@[sortDescriptor]];

    [self writeScores:scores];
}

+ (BOOL)writeScores:(NSArray*)scores {
    NSLog(@"values written to archive: %@", scores);

    return [NSKeyedArchiver archiveRootObject:scores toFile:[self filePath]];
}

+ (NSArray*)readScores {
    NSArray *scores = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
    NSLog(@"value read from archive: %@", scores);
    if (scores == NULL) {
        NSLog(@"encountered null value from archive");
        scores = @[];
    }
    return scores;
}

@end
