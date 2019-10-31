//
//  HighScoreArchiver.m
//  NumberTileGame
//
//  Created by Michael Prouty on 10/30/19.
//

#import "HighScoreArchiver.h"
static NSString *const highScoreArchivePath = @"highScoreArchive";

@interface HighScoreArchiver()
+ (BOOL)writeScores:(NSArray*)scores;
@end

@implementation HighScoreArchiver

+ (NSString*)filePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *path = [documentsDirectoryPath stringByAppendingPathComponent:highScoreArchivePath];
    // NSLog(@"File path: %@", path);
    return path;
}

+ (void)addScore:(NSNumber*)score {
    NSLog(@"new score added: %@", score);

    NSArray* scores = self.readScores;
    scores = [scores arrayByAddingObject:score];

    // This makes me cry
    scores = [scores sortedArrayUsingSelector:@selector(compare:)];
    scores = [[scores reverseObjectEnumerator] allObjects];

    if ([scores count] > 3) {
        scores = [scores subarrayWithRange:NSMakeRange(0, 3)];
    }

    [self writeScores:scores];
}

+ (BOOL)writeScores:(NSArray*)scores {
    NSLog(@"values written to archive: %@", scores);

    return [NSKeyedArchiver archiveRootObject:scores toFile:[self filePath]];
}

+ (NSArray*)readScores {
    NSArray *scores = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
    NSLog(@"value read from archive: %@", scores);
    // TODO: is this null check right?
    // I also tried (scores == [NSNull null]), which didn't work.
    // I'm assuming NSNull is a null object, and 'NULL' is a primitive...
    // What's the correct pattern for this?
    if (scores == NULL) {
        NSLog(@"encountered null value from archive");
        scores = @[];
    }
    return scores;
}

@end
