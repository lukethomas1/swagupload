//
//  ViewController.h
//  Swagupload
//
//  Created by Eric Zhang on 1/30/16.
//  Copyright (c) 2016 Eric Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>

@interface ViewController : UIViewController

- (IBAction)selectImage:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *selectedImage;
@property (strong, nonatomic) IBOutlet UILabel *result;
- (IBAction)upload:(id)sender;

@end

