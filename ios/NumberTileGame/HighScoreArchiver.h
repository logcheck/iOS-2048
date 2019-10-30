//
//  HighScoreArchiver.h
//  
//
//  Created by Michael Prouty on 10/30/19.
//

#ifndef HighScoreArchiver_h
#define HighScoreArchiver_h

@interface HighScoreArchiver : NSObject
+ (void)addScore:(NSNumber*)score;
+ (NSArray*)readScores;
@end

#endif /* HighScoreArchiver_h */
