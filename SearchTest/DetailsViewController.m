//
//  DetailsViewController.m
//  SearchTest
//
//  Created by alexbutenko on 7/22/14.
//  Copyright (c) 2014 alex. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
- (IBAction)onDone:(id)sender;

@end

@implementation DetailsViewController

- (IBAction)onDone:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
