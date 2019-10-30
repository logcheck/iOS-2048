//
//  HighScoreArchiver.h
//  
//
//  Created by Michael Prouty on 10/30/19.
//

#ifndef HighScoreArchiver_h
#define HighScoreArchiver_h

@interface HighScoreArchiver : NSObject

+ (BOOL)writeScore:(NSNumber*)score;
+ (NSNumber*)readScore;
@end

#endif /* HighScoreArchiver_h */
