//
//  ViewController.m
//  stopwatch
//
//  Created by user151112 on 26.1.19..
//  Copyright © 2019. user151112. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    count = 0;
    runing = false;
    // Do any additional setup after loading the view, typically from a nib.
    
    _startButton.layer.cornerRadius = 45;
    _resetButton.layer.cornerRadius = 45;
}

- (IBAction)backgroundTap:(id)sender{
    [self.view endEditing:YES];
}
- (IBAction)startTimer:(id)sender {
    runing = !runing;
    NSString *title = runing ? @"STOP" : @"START";
    
    if ( runing ){
        if ( myTimer == nil ){
            myTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
        }
    }
    else {
        [myTimer invalidate];
        myTimer = nil;
    }
    
    [_startButton setTitle:title forState:UIControlStateNormal];
}

- (IBAction)resetTimer:(id)sender {
    runing = false;
    count = 0;
    [myTimer invalidate];
    myTimer = nil;
    [_startButton setTitle:@"START" forState:UIControlStateNormal];
    _timerDisplay.text = @"00:00.00";
}

-(void) updateTime{
    count++;
    
    int minutes = floor(count/100/60);
    int seconds = floor(count/100);
    int mseconds = count % 100;
    
    int secInMinute = seconds % 60;
    
    _timerDisplay.text = [NSString stringWithFormat:@"%02d:%02d.%02d", minutes, secInMinute, mseconds];
}

@end
