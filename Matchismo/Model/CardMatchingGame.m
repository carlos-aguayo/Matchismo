//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Carlos Aguayo on 5/18/14.
//  Copyright (c) 2014 Dreamskiale. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) int score;
@property (nonatomic, strong) NSMutableArray *cards; // of Cards



@end


@implementation CardMatchingGame

static const int COST_TO_CHOOSE = 1;
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;

- (NSMutableArray*) cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype) initCardWithCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card* card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (void) chooseCardAtIndex:(NSUInteger)index {
    
    Card* card = [self cardAtIndex:index];
    
    if ([card isMatched]) {
        return;
    }
    
    if ([card isChosen]) {
        // If card is chosen, just flip it
        card.chosen = NO;
    } else {
        // If card is not chosen, we need to:
        // 1. Check if any other card has already been chosen and match it
        for (int i = 0; i < [self.cards count]; i++) {
            Card* other = [self cardAtIndex:i];
            if (other.isChosen && !other.isMatched) {
                int points = [other match:@[card]];
                if (points > 0) {
                    self.score += points * MATCH_BONUS;
                    card.matched=YES;
                    other.matched=YES;
                } else {
                    self.score -= MISMATCH_PENALTY;
                    other.chosen = NO;
                }
                break;
            }
        }
        // 2. Decrease score as there was a penalty.
        card.chosen = YES;
        self.score -= COST_TO_CHOOSE;
        
        NSLog(@"Score is %d",  self.score);
    }
}

- (Card*) cardAtIndex:(NSUInteger)index {
    
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
