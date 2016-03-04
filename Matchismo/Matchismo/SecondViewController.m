//
//  SecondViewController.m
//  Matchismo
//
//  Created by iOS Entwickler on 04.03.16.
//  Copyright (c) 2016 noorg. All rights reserved.
//

#import "SecondViewController.h"
#import "PlayingCardView.h";

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.playingCardView.suit = @"♥️";
    self.playingCardView.rank = 13;

}



@end
