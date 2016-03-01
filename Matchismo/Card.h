//
//  Card.h
//  Matchismo
//
//  Created by iOS Entwickler on 29.02.16.
//  Copyright (c) 2016 noorg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
