//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Carlos Aguayo on 4/27/14.
//  Copyright (c) 2014 Dreamskiale. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@end

@implementation CardGameViewController

- (void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"Flip count changed to %d", self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"A♣︎" forState:UIControlStateNormal];
    }
    self.flipCount++;
}

@end
