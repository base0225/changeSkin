//
//  secondVC.m
//  1107ZJ换肤
//
//  Created by base on 15/09/19.
//  Copyright © 2015年 base. All rights reserved.
//

#import "secondVC.h"
#import "SkinTools.h"

@interface secondVC ()

@property (weak, nonatomic) IBOutlet UIImageView *back2Img;

@end

@implementation secondVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpImage];

    /*
    NSString *skin = [[NSUserDefaults standardUserDefaults] objectForKey:@"skin"];
    self.back2Img.image = [UIImage imageNamed:skin];
*/
}

- (void)setUpImage
{
    self.back2Img.image = [SkinTools imageNamed:@"back.png"];
    
//    [self.btn setBackgroundImage:[SkinTools imageNamed:@"button_back.png"] forState:UIControlStateNormal];
}


@end
