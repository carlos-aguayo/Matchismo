//
//  PlayingCard.h
//  Matchismo
//
//  Created by Carlos Aguayo on 10/19/13.
//  Copyright (c) 2013 Dreamskiale. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

/** There are only four suits "♥","♦","♣","♠" */
@property (strong, nonatomic) NSString *suit;
/** A number between 1 and 13, where 11-13 are J, Q, and K */
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
