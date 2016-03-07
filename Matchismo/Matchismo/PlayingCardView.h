//
//  PlayingCardView.h
//  Matchismo
//
//  Created by iOS Entwickler on 04.03.16.
//  Copyright (c) 2016 noorg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property(nonatomic)NSUInteger rank;
@property(nonatomic, strong)NSString *suit;
@property(nonatomic) BOOL faceUp;

- (void)pinch: (UIPinchGestureRecognizer *)gesture;

@end
