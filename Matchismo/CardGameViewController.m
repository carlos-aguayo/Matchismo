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
@property (weak, nonatomic) IBOutlet UILabel *cardsLeftLabel;
@property (nonatomic) int flipCount;
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
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flips updated to %d", self.flipCount);
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.memoryGame flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
//    sender.selected = !sender.isSelected;
//    if (sender.selected) {
//        Card *card = [self.deck drawRandomCard];
//        [sender setTitle:card.contents forState:UIControlStateNormal];
//        
//    }
//    self.cardsLeftLabel.text = [NSString stringWithFormat:@"Cards left: %d", [self.deck cardsLeft]];
//    self.flipCount++;
}

- (void) updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.memoryGame cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = !card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = (card.isUnplayable) ? 0.3f : 1.0f;
        [cardButton setBackgroundImage:(cardButton.selected) ? [UIImage imageNamed:@"cardfront.png"] : [UIImage imageNamed:@"cardback.png"] forState:UIControlStateNormal];
    }
}

@end
