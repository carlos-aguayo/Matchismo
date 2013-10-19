//
//  Deck.h
//  Matchismo
//
//  Created by Carlos Aguayo on 10/19/13.
//  Copyright (c) 2013 Dreamskiale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (Card *)drawRandomCard;

@end
