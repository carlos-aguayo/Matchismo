//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Carlos Aguayo on 5/18/14.
//  Copyright (c) 2014 Dreamskiale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// Our game lets you match among a certain number of cards given a
// certain deck to choose from.
// So let's have an initializer that initializes a newly allocated
// game with those two pieces of information.
- (instancetype) initCardWithCount:(NSUInteger)count
                         usingDeck:(Deck*)deck;

// Obviously it must be possible to choose a card in our card
// matching game.
- (void) chooseCardAtIndex:(NSUInteger)index;

// And it must be possible to get a card so that, for example,
// it can be displayed by some UI somewhere.
- (Card*) cardAtIndex:(NSUInteger)index;

// It keeps a score
@property (nonatomic, readonly) int score;

@end
