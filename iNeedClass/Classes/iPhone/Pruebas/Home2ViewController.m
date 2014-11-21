//
//  Home2ViewController.m
//  iNeedClass
//
//  Created by injevm on 20/11/14.
//  Copyright (c) 2014 Jesus Victorio. All rights reserved.
//

#import "Home2ViewController.h"
#import "HomeViewController.h"

@interface Home2ViewController ()

@end

@implementation Home2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self prepareScrollView];
    [self prepareTabBar];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareScrollView
{
    [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width*2, self.scrollView.contentSize.height)];
    [self.scrollView setDelegate:self];
    
    
    UIView *nueva = [[UIView alloc]initWithFrame:CGRectMake(320, 0, 320, 568)];
    
    [nueva setBackgroundColor:[UIColor greenColor]];
    
    HomeViewController *home1 = [[HomeViewController alloc]init];
    HomeViewController *home2 = [[HomeViewController alloc]init];
    
    [home1.view setFrame:CGRectMake(0, 0, 320, 568)];
    [home2.view setFrame:CGRectMake(320, 0, 320, 568)];
    
    [self.scrollView addSubview:home1.view];
    [self.scrollView addSubview:home2.view];
    
}

- (void)prepareTabBar
{
    [self.tabBar.layer setBorderWidth:0.0];
    
    [self.tabBar setSelectedItem:[self.tabBar.items objectAtIndex:0]];
    
    [self.tabBar.selectedItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] } forState:UIControlStateSelected];
    
    [self.tabBar setSelectedImageTintColor:[UIColor whiteColor]];
    
    self.tabBar.rippleFromTapLocation = YES;  // YES = spawn tap-circles from tap locaiton. NO = spawn tap-circles from the center of the tab.
    
    self.tabBar.usesSmartColor = YES; // YES = colors are chosen from the tabBar.tintColor. NO = colors will be shades of gray.
    
    self.tabBar.tapCircleColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];    // Set this to customize the tap-circle color.
    
    self.tabBar.backgroundFadeColor = [UIColor whiteColor];  // Set this to customize the background fade color.
    
    self.tabBar.tapCircleDiameter = bfPaperTabBar_tapCircleDiameterLarge;    // Set this to customize the tap-circle diameter.
    
    self.tabBar.underlineColor = [UIColor whiteColor]; // Set this to customize the color of the underline which highlights the currently selected tab.
    
    self.tabBar.showUnderline = YES;  // YES = show the underline bar, NO = hide the underline bar.
    
    self.tabBar.underlineThickness = 2.f;    // Set this to adjust the thickness (height) of the underline bar. Not that any value greater than 1 could cover up parts of the TabBarItem's title.
    self.tabBar.showTapCircleAndBackgroundFade = YES; // YES = show the tap-circles and add a color fade the background. NO = do not show the tap-circles and background fade.
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.x == 0)
    {
        [self.tabBar setSelectedItem:[self.tabBar.items objectAtIndex:0]];
    }else{
        [self.tabBar setSelectedItem:[self.tabBar.items objectAtIndex:1]];
    }
}

#pragma mark TABBAR delegate

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (item == self.menuItem)
    {
        NSInteger width = self.scrollView.contentSize.width/2;
        if(self.scrollView.bounds.origin.x != width)
        {
            [self.scrollView setContentOffset:CGPointMake(width, 0) animated:YES];
        }
    }
    else
    {
        if(self.scrollView.bounds.origin.x != 0.0)
        {
            [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
    }
    
}

@end
