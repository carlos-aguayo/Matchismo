//
//  PlayingCard.m
//  Matchismo
//
//  Created by Carlos Aguayo on 4/27/14.
//  Copyright (c) 2014 Dreamskiale. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    for (int i = 0; i < [otherCards count]; i++) {
        PlayingCard* other = otherCards[i];
        if ([self.suit isEqualToString:[other suit]]) {
            score += 1;
        }
        if (self.rank == other.rank) {
            score += 4;
        }
    }
    
    return score;
}

- (NSString *) contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+ (NSArray *) validSuits {
    return @[@"♠︎", @"♣︎", @"♥︎", @"♦︎"];
}

- (void) setSuit:(NSString *) suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *) suit {
    return _suit ? _suit : @"?";
}

+ (NSArray *) rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger) maxRank {
    return [[PlayingCard rankStrings] count] - 1;
}

- (void) setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
