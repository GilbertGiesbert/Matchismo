//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by iOS Entwickler on 03.03.16.
//  Copyright (c) 2016 noorg. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck{
    
    return [[PlayingCardDeck alloc] init];
    
}

@end
