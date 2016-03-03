//
//  CardGameViewController.m
//  Matchismo
//
//  Created by iOS Entwickler on 26.02.16.
//  Copyright (c) 2016 noorg. All rights reserved.
//


#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "Card.h"
#import "CardMatchingGame.h"


@interface CardGameViewController ()

@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;

@end

@implementation CardGameViewController




- (IBAction)touchedCardButton:(UIButton *)sender {
    
    int cardIndex = [self.cardButtons indexOfObject:sender];
    
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
    
}
- (IBAction)touchedResetButton:(UIButton *)sender {
    
    [self resetGame];
    [self updateUI];
    
}




- (void)updateUI{
    
    for(UIButton *cardButton in self.cardButtons){
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
}

- (NSString *)titleForCard:(Card *)card{
    
    return card.isChosen ? card.contents : @"";
    
}

- (UIImage *)backgroundImageForCard:(Card *)card{
    
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
    
}


- (Deck *)createDeck{ // abstract
    return nil;
}



- (CardMatchingGame *)game{
    
    if(!_game){
        [self resetGame];
    }
    return _game;
}

- (void)resetGame{
    _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
}


- (Deck *)deck{
    
    if(!_deck){
        _deck = [self createDeck];
    }
    return _deck;
}




@end