//
//  Deck.m
//  Matchismo
//
//  Created by Carlos Aguayo on 4/27/14.
//  Copyright (c) 2014 Dreamskiale. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards; // of Card

@end

@implementation Deck

- (NSMutableArray *) cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void) addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (void) addCard:(Card *)card {
    [self addCard:card atTop:NO];
}

- (Card *) drawRandomCard {
    Card *randomCard = nil;
    
    if ([self.cards count]) {
      unsigned index = arc4random() % [self.cards count];
      randomCard = self.cards[index];
      [self.cards removeObjectAtIndex:index];
      NSLog(@"Drew random card, cards left: %d", [self.cards count]);
    }
    
    return randomCard;
}

@end
