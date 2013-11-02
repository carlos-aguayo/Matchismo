//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Carlos Aguayo on 10/27/13.
//  Copyright (c) 2013 Dreamskiale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;

@property (nonatomic) BOOL faceUp;

- (void)pinch:(UIPinchGestureRecognizer *) gesture;

@end
