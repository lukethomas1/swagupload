//
//  ViewController.m
//  Swagupload
//
//  Created by Eric Zhang on 1/30/16.
//  Copyright (c) 2016 Eric Zhang. All rights reserved.
//

#import "ViewController.h"
@import Firebase;
@import FirebaseDatabase;
@import FirebaseStorage;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* Opens a view to select image from photo library */
- (IBAction)selectImage:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentModalViewController:picker animated:YES];
}

/* Callback after user selects an image */
- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    self.selectedImage.image = image;
    [[picker parentViewController] dismissModalViewControllerAnimated:YES];
}

/* Uploads image to FirebaseStorage after user presses upload button, while also generating
   a secret code that is sent to FirebaseDatabase and displayed on user screen */
- (IBAction)upload:(id)sender {
    UIImage *uploadImage = self.selectedImage.image;
    NSData *imageData = UIImageJPEGRepresentation(uploadImage, 0.9);
    
    // using base64StringFromData method, we are able to convert data to string
//    NSString *imageString = [NSString base64StringFromData:imageData length:[imageData length]];

    NSInteger random = arc4random_uniform(1000);
    NSNumber *rand = [NSNumber numberWithInt:random];
    self.result.text = [NSString stringWithFormat:@"Secret code: %@", [@(random) stringValue]];

    
    FIRDatabaseReference *ref = [[[FIRDatabase database] reference] child:@"code"];
    FIRStorageReference *storage = [[[FIRStorage storage] reference] child: [NSString stringWithFormat:@"images/%@.jpg", rand]];
    [storage putData:imageData metadata:nil completion:^(FIRStorageMetadata * _Nullable metadata, NSError * _Nullable error) {
        [[ref child:[NSString stringWithFormat:@"%@", rand]] setValue: metadata.downloadURL.absoluteString];
    }];
}

@end
