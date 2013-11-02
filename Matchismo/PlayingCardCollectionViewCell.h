//
//  PlayingCardCollectionViewCell.h
//  Matchismo
//
//  Created by Carlos Aguayo on 11/2/13.
//  Copyright (c) 2013 Dreamskiale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCardView.h"

@interface PlayingCardCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@end
