//
//  Card.m
//  Matchismo
//
//  Created by iOS Entwickler on 29.02.16.
//  Copyright (c) 2016 noorg. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (int)match:(NSArray *)otherCards{

    int score = 0;

    for(Card *card in otherCards){

        if([card.contents isEqualToString:self.contents]){
            score = 1;
            break;
        }
    }
    return score;
}

@end