//
//  ViewController.m
//  TwitterAndFacebook
//
//  Created by LLDM on 02/08/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)facebookPost:(id)sender {
    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    SLComposeViewControllerCompletionHandler myBlock = ^(SLComposeViewControllerResult result) {
        if (result == SLComposeViewControllerResultCancelled) {
            NSLog(@"Cancelled");
        }
        else {
            NSLog(@"Done");
        }
        [controller dismissViewControllerAnimated:YES completion:nil];
    };
    controller.completionHandler =myBlock;
    
    //Adding the Text to the facebook post value from iOS
    [controller setInitialText:@"My test post"];
    
    //Adding the URL to the facebook post value from iOS
    [controller addURL:[NSURL URLWithString:@"http://www.test.com"]];
    
    //Adding the Text to the facebook post value from iOS
    [self presentViewController:controller animated:YES completion:nil];
}

-(IBAction)twitterPost:(id)sender {
    SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [tweetSheet setInitialText:@"My test tweet"];
    [self presentViewController:tweetSheet animated:YES completion:nil];
}

@end
