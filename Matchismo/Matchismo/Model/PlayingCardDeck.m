//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by iOS Entwickler on 29.02.16.
//  Copyright (c) 2016 noorg. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init{

    self = [super init];

    // don't try to init if super could not init
    if(self){


        NSLog(@"init PlayingCardDeck");

        for(NSString *suit in [PlayingCard validSuits]){

            for(NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++){
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
                // NSLog(@"adding card: %@ %lu", suit, (unsigned long)rank);

            }

        }
    }

    return self;

}

@end