//
//  ViewController.m
//  XCGuideMaskViewExample
//
//  Created by 樊小聪 on 2017/9/20.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "ViewController.h"

#import "XCGuideMaskView.h"


@interface ViewController ()<XCGuideMaskViewDataSource, XCGuideMaskViewLayout>

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *collectionViews;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - 🎬 👀 Action Method 👀

- (IBAction)show:(id)sender
{
    XCGuideMaskView *maskView = [[XCGuideMaskView alloc] initWithDatasource:self];
    maskView.layout = self;
    [maskView show];
}

#pragma mark - 📕 👀 XCGuideMaskViewDataSource 👀

- (NSInteger)numberOfItemsInGuideMaskView:(XCGuideMaskView *)guideMaskView
{
    return self.collectionViews.count;
}

- (UIView *)guideMaskView:(XCGuideMaskView *)guideMaskView viewForItemAtIndex:(NSInteger)index
{
    return self.collectionViews[index];
}

- (NSString *)guideMaskView:(XCGuideMaskView *)guideMaskView descriptionForItemAtIndex:(NSInteger)index
{
    return [NSString stringWithFormat:@"这是第 %zi 个视图的描述", index];
}

- (UIColor *)guideMaskView:(XCGuideMaskView *)guideMaskView colorForDescriptionAtIndex:(NSInteger)index
{
    return arc4random_uniform(2) ? [UIColor whiteColor] : [UIColor redColor];
}

- (UIFont *)guideMaskView:(XCGuideMaskView *)guideMaskView fontForDescriptionAtIndex:(NSInteger)index
{
    return arc4random_uniform(2) ? [UIFont systemFontOfSize:13] : [UIFont systemFontOfSize:15];
}

#pragma mark - 👀 XCGuideMaskViewLayout 👀 💤

- (CGFloat)guideMaskView:(XCGuideMaskView *)guideMaskView cornerRadiusForViewAtIndex:(NSInteger)index
{
    if (index == self.collectionViews.count - 1)
    {
        return 25;
    }
    
    return 5;
}


@end
