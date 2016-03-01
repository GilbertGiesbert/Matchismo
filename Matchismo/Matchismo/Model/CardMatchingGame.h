//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by iOS Entwickler on 29.02.16.
//  Copyright (c) 2016 noorg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex: (NSUInteger)index;
- (Card *)cardAtIndex: (NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
