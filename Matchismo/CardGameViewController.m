//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Carlos Aguayo on 10/18/13.
//  Copyright (c) 2013 Dreamskiale. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "MemoryGame.h"

#define NUMBER_OF_CARDS 16

@interface CardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;

@property (strong, nonatomic) PlayingCardDeck *deck;
@property (strong, nonatomic) MemoryGame *memoryGame;
@end

@implementation CardGameViewController

- (MemoryGame *) memoryGame {
    if (!_memoryGame) {
        _memoryGame = [[MemoryGame alloc] initWithCardCount:NUMBER_OF_CARDS usingDeck:self.deck];
    }
    return _memoryGame;
}

- (PlayingCardDeck *) deck {
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];   
    }
    return _deck;
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.memoryGame flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
}

- (void) updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.memoryGame cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateNormal];
        // TODO: Why do I need to do the OR in here???
        [cardButton setTitle:card.contents forState:UIControlStateNormal|UIControlStateDisabled];
        cardButton.selected = !card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = (card.isUnplayable) ? 0.3f : 1.0f;
    }
}

@end
