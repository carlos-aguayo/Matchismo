//
//  MemoryGame.h
//  Matchismo
//
//  Created by Carlos Aguayo on 10/19/13.
//  Copyright (c) 2013 Dreamskiale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) int score;


/**
 * \param cardCount The total number of cards to have on the board
 * \param deck The deck to use
 */
- (id)initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck;
- (void)flipCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@end
