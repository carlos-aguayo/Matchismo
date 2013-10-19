//
//  Card.h
//  Matchismo
//
//  Created by Carlos Aguayo on 10/19/13.
//  Copyright (c) 2013 Dreamskiale. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

/** What the card is, can be something like "A♠" */
@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isFaceUp) BOOL faceUp;
@property (nonatomic, getter=isUnplayable) BOOL unplayable;

/** 
  Returns how much it matches another card, if it doesn't match
  it at all, it will return a zero, another identical card would be a 1.
 */
- (int) match:(NSArray *)otherCards;

@end
