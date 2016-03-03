//
//  CardGameViewController.h
//  Matchismo
//
//  Created by iOS Entwickler on 01.03.16.
//  Copyright (c) 2016 noorg. All rights reserved.
//
// ABSTRACT


#import <UIKit/UIKit.h>
#import "Deck.h"


@interface CardGameViewController : UIViewController

- (Deck *)createDeck; // abstract


@end
