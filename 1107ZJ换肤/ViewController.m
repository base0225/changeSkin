//
//  ViewController.m
//  1107ZJ换肤
//
//  Created by base on 15/09/19.
//  Copyright © 2015年 base. All rights reserved.
//

#import "ViewController.h"
#import "SkinTools.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *backImg;


@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    /*
    NSString *skin = [[NSUserDefaults standardUserDefaults] objectForKey:@"skin"];
    self.backImg.image = [UIImage imageNamed:skin];
    NSString *iconName = [skin stringByAppendingString:@"_icon"];
    
    [self.btn setBackgroundImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    */
    [self setUpImage];
    
}

- (IBAction)zhongqiu:(id)sender {
    
    [SkinTools setSkinWithName:kSkinNameZQ];
 
    [self setUpImage];
//    [self setSkinName:@"zhongqiu"];
}

- (IBAction)guoqin:(id)sender {

    [SkinTools setSkinWithName:kSkinNameGQ];
    
    [self setUpImage];
//    [self setSkinName:@"guoqing"];

}

- (IBAction)chunjie:(id)sender {
    
    [SkinTools setSkinWithName:kSkinNameCJ];

    [self setUpImage];
//    [self setSkinName:@"chunjie"];
}

/*
- (void)setSkinName:(NSString *)name
{
    self.backImg.image = [UIImage imageNamed:name];
    
    NSString *iconName = [name stringByAppendingString:@"_icon"];
    
    [self.btn setBackgroundImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    
    //放到沙盒中
    [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"skin"];
    //同步(偏好设置是在空闲的时候归档，所以需要同步)
    [[NSUserDefaults standardUserDefaults] synchronize];
}
*/
- (void)setUpImage
{
    self.backImg.image = [SkinTools imageNamed:@"back.png"];
    
    [self.btn setBackgroundImage:[SkinTools imageNamed:@"button_back.png"] forState:UIControlStateNormal];
    
    self.textLabel.textColor = [SkinTools skinColorWithType:kskinColorTypeLabel];
}

@end
