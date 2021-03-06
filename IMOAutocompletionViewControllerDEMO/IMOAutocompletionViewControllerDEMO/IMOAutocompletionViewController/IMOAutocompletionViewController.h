//
//  IMOAutocompletionViewController.h
//  IMOAutoCompletionTextField DEMO
//
//  Created by Cormier Frederic on 28/05/12.
//  Copyright (c) 2012 International MicrOondes. All rights reserved.
//

#import <UIKit/UIKit.h>

//#define COMPLETION_DEBUG

@class IMOAutocompletionViewController;


@protocol IMOAutocompletionViewDataSource <NSObject>

- (NSArray *)sourceForAutoCompletionTextField:(IMOAutocompletionViewController *)autocompletionViewController;

@end


@protocol IMOAutocompletionViewDelegate <NSObject>

- (void)IMOAutocompletionViewControllerReturnedCompletion:(NSString *)completion;

@end


@interface IMOAutocompletionViewController : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (assign, nonatomic) id <IMOAutocompletionViewDataSource> dataSource;
@property (assign, nonatomic) id <IMOAutocompletionViewDelegate> delegate;



- (id)initWithLabelString:(NSString *)lstring
          textFieldString:(NSString *)tfstring
      backgroundImageName:(NSString *) bgImageName;
@end

