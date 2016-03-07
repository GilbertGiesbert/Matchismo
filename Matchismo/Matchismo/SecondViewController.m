//
//  SecondViewController.m
//  Matchismo
//
//  Created by iOS Entwickler on 04.03.16.
//  Copyright (c) 2016 noorg. All rights reserved.
//

#import "SecondViewController.h"
#import "PlayingCardView.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;
@property (strong, nonatomic) Deck *deck;

@end

@implementation SecondViewController

- (Deck *)deck{
    if(!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (void)drawRandomPlayingCard{
    
    Card *card = [self.deck drawRandomCard];
    if([card isKindOfClass:[PlayingCard class]]){
        
        PlayingCard *playingCard = (PlayingCard *)card; // cast
        self.playingCardView.rank = playingCard.rank;
        self.playingCardView.suit = playingCard.suit;
        
    }
    
}

- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    
    if(!self.playingCardView.faceUp)
        [self drawRandomPlayingCard];
        
    self.playingCardView.faceUp = !self.playingCardView.faceUp;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.playingCardView.suit = @"♥️";
    self.playingCardView.rank = 13;
    
    [self.playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.playingCardView action:@selector(pinch:)]];

}



@end
