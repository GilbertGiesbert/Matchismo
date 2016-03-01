//
//  PlayingCard.h
//  Matchismo
//
//  Created by iOS Entwickler on 29.02.16.
//  Copyright (c) 2016 noorg. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end
