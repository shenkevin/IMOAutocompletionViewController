//
//  ViewController.m
//  IMOAutoCompletionTextField DEMO
//
//  Created by Cormier Frederic on 28/05/12.
//  Copyright (c) 2012 International MicrOondes. All rights reserved.
//

#import "ViewController.h"
#import "IMOWords.h"
#import "IMOAutocompletionViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()


@property(nonatomic,retain)UITextField *tf;
@property(nonatomic,retain)NSString *theItem;

@end

@implementation ViewController

@synthesize tf = tf_;
@synthesize theItem = theItem_;


- (void)viewDidLoad {
    [super viewDidLoad];
    

    tf_ = [[UITextField alloc] initWithFrame:CGRectMake(20.0, 60.0, 280.0, 32.0)];
    [[self tf] setBackgroundColor:[UIColor whiteColor]];
    [tf_ setDelegate:self];
    [tf_ setBorderStyle:UITextBorderStyleRoundedRect];
    [[self view] addSubview:[self tf]]; 
    [tf_ release];
    
    theItem_ = @"fgqfYYL";
   
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self tf] setText:[self theItem]];
}


- (void)dealloc {
    [theItem_ release];
    [super dealloc];
}



- (void)viewDidUnload {
    [self setTf:nil];
    [super viewDidUnload];
   
}




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [textField resignFirstResponder];
    IMOAutocompletionViewController *acvc = [[IMOAutocompletionViewController alloc]
                                             initWithLabelString:@"Label:" 
                                             textFieldString:[self theItem] 
                                             backgroundImageName:@"sandpaperthin.png"];
     
    [acvc setDataSource:(id<IMOAutocompletionViewDataSource>)self];
    [acvc setDelegate:(id<IMOAutocompletionViewDelegate>)self];
    [acvc setTitle:@"Demo"];
  
    
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:acvc];
    [[self navigationController] presentModalViewController:navController animated:YES];
    [acvc release];
    [navController release];
}


#pragma  mark - IMOAutocompletionViewController delegate and dataSource

- (NSArray *)sourceForAutoCompletionTextField:(IMOAutocompletionViewController *)autocompletionViewController {
    return [[IMOWords sharedWords] tokens];
//    return @[@"xorldi", @"hello", @"foo", @"Bar", @"baz", @"World"];
    
}

- (void)IMOAutocompletionViewControllerReturnedCompletion:(NSString *)completion {
    [self setTheItem:completion];
}

@end
