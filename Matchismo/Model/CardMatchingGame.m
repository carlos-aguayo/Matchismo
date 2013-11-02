//
//  MemoryGame.m
//  Matchismo
//
//  Created by Carlos Aguayo on 10/19/13.
//  Copyright (c) 2013 Dreamskiale. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic, readwrite) int score;

@end

@implementation CardMatchingGame

- (NSMutableArray *) cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck{
    self = [super init];
    if (self) {
        for (int i = 0; i < cardCount; i++) {
            Card* card = [deck drawRandomCard];
            [self.cards addObject:card];
            self.score = 0;
        }
    }
    return self;
}


- (void)flipCardAtIndex:(NSUInteger)index{
    Card* card = [self.cards objectAtIndex:index];
    if ([card isUnplayable]) {
        // If the card is unplayable, do nothing, we can't flip this card.
        // In theory this couldn't happen as an unplayable card is disabled.
        return;
    }
    card.faceUp = ![card isFaceUp];
    if ([card isFaceUp]) {
        // let's see if it matches.
        NSMutableArray* faceUpCards = [self getFaceUpCards];
        [faceUpCards removeObject:card];
        
        int score = [card match:faceUpCards];
        BOOL matchFound = score > 0;
        if (matchFound) {
            // We have a match, so let's leave the card up (unplayable)
            [self makeCardsUnPlayable:faceUpCards card:card];
        } else {
            // No score, so no match, let's make the faceUpCards turn down
            for (Card* otherCard in faceUpCards) {
                if (!otherCard.isUnplayable) {
                    otherCard.faceUp = NO;
                }
            }
        }
        
    }
}

- (void) makeCardsUnPlayable:(NSArray*) cards card:(Card*) card {
    for (Card* otherCards in cards) {
        otherCards.unplayable = YES;
    }
    card.unplayable = YES;
}

- (NSMutableArray *) getFaceUpCards {
    NSMutableArray* up = [[NSMutableArray alloc] init];
    for (Card* card in self.cards) {
        if ([card isFaceUp] && ![card isUnplayable]) {
            [up addObject:card];
        }
    }
    return up;
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return [self.cards objectAtIndex:index];
}


@end