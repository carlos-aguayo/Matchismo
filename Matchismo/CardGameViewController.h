//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Carlos Aguayo on 10/18/13.
//  Copyright (c) 2013 Dreamskiale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController

- (Deck *) createDeck; // abstract

@property (nonatomic) NSUInteger startingCardCount; // abstract

- (void) updateCell:(UICollectionViewCell *) cell usingCard:(Card *) card;

@end
