//
//  ViewController.h
//  stopwatch
//
//  Created by user151112 on 26.1.19..
//  Copyright © 2019. user151112. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSTimer *myTimer;
    BOOL runing;
    int count;
}

@property (strong, nonatomic) IBOutlet UILabel *timerDisplay;
@property (strong, nonatomic) IBOutlet UIButton *resetButton;
@property (strong, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startTimer:(id)sender;
- (IBAction)resetTimer:(id)sender;

-(void) updateTime;

@end

