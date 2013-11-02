//
//  PlayingCardView.m
//  SuperCard
//
//  Created by Carlos Aguayo on 10/27/13.
//  Copyright (c) 2013 Dreamskiale. All rights reserved.
//

#import "PlayingCardView.h"

@interface PlayingCardView()
@property (nonatomic) CGFloat faceCardScaleFactor;

@end

@implementation PlayingCardView

@synthesize faceCardScaleFactor = _faceCardScaleFactor;

#define DEFAULT_FACE_CARD_SCALE_FACTOR 0.75

- (CGFloat) faceCardScaleFactor {
    if (!_faceCardScaleFactor) _faceCardScaleFactor = DEFAULT_FACE_CARD_SCALE_FACTOR;
    return _faceCardScaleFactor;
}

- (void) setFaceCardScaleFactor:(CGFloat)faceCardScaleFactor {
    _faceCardScaleFactor = faceCardScaleFactor;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
     // Drawing code
     
     // Let's do the background of the card
     // rounded rect with white background
     // little thin black border
     // im goinna have the card completely fill the bounds, so that's why it's self.bounds, not self.frame
     // corner radious is how long the corner is
     UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:12.0];
     
     // let's clip to it
     // my view can be transparent and it's only going to draw inside this rect
     [roundedRect addClip];

     // using the clip means that i can do something like this
     // bit white rectangle filled with white
     // but because it's clipped, it won't put white on the corners.
     [[UIColor whiteColor] setFill];
     UIRectFill(self.bounds);
      
     [[UIColor blackColor] setStroke];
     [roundedRect stroke];
    
    if (self.faceUp) {

     NSString *imageName = [NSString stringWithFormat:@"%@%@.jpg", [self rankAsString], self.suit];
     UIImage *faceImage = [UIImage imageNamed:imageName];
     if (faceImage) {
         CGRect imageRect = CGRectInset(self.bounds,
                                        self.bounds.size.width * (1.0 - self.faceCardScaleFactor),
                                        self.bounds.size.height * (1.0 - self.faceCardScaleFactor));
         [faceImage drawInRect:imageRect];
     } else {
         [self drawPips];
     }
     
     [self drawCorners];
    } else {
        [[UIImage imageNamed:@"playing-card-back.jpg"] drawInRect:self.bounds];
    }
    
 }

- (void) pinch:(UIPinchGestureRecognizer *)gesture {
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        self.faceCardScaleFactor *= gesture.scale;
        gesture.scale = 1;
    }
}


- (void) drawPips {
    
}

- (void) drawCorners {
    // create a string for the kinf of characters
    // set the paragraph style to be centred
    // ask that box how big it is and put in the coerner
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    UIFont *cornerFont = [UIFont systemFontOfSize:self.bounds.size.width * 0.20];
    
    NSString *s = [NSString stringWithFormat:@"%@\n%@", [self rankAsString], self.suit];
    NSDictionary *d = @{NSParagraphStyleAttributeName:paragraphStyle,
                        NSFontAttributeName:cornerFont};
    
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:s
                                                                     attributes:d];
    
    CGRect textBounds;
    textBounds.origin = CGPointMake(2.0, 2.0);
    textBounds.size = [cornerText size];
    [cornerText drawInRect:textBounds];
    
    [self pushContextAndRotateUpsideDown];
    [cornerText drawInRect:textBounds];
    [self popContext];
}

- (NSString *) rankAsString {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7",
             @"8", @"9", @"10", @"J", @"Q", @"K"][self.rank];
}

- (void)pushContextAndRotateUpsideDown {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
}

- (void)popContext {
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
}


//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}

- (void) setSuit:(NSString *) suit {
    _suit = suit;
    [self setNeedsDisplay];
}

- (void) setRank:(NSUInteger) rank {
    _rank = rank;
    [self setNeedsDisplay];
}

- (void) setFaceUp:(BOOL)faceUp {
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

#pragma mark - Initialization

- (void) setup {
    // do initialization here
}

- (void) awakeFromNib {
    [self setup];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}


@end
