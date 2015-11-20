//
//  AppDelegate.m
//  MyImageListView
//
//  Created by mac on 15-10-30.
//  Copyright (c) 2015年 Appcoda. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate
-(void)awakeFromNib
{
    [self.imageListView setDataSource:self];
}
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
//    PRImageListView *imagListView  = [[PRImageListView alloc]init];
//    [imagListView setDataSource:self];
//    [self.window.contentView addSubview:imagListView];
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

#pragma mark -PRImageListViewDataSource

-(NSInteger)imageListView:(PRImageListView*)imageListView numberOfItemsInSection:(NSInteger)section
{
    return section+4;
}
-(PRImageListViewCell*)imageListView:(PRImageListView *)imageListView cellForItemAtSection:(NSInteger)section cellForItemAtIndex:(NSInteger)index;

{
    NSString *identifier = [NSString stringWithFormat:@"identifier is (section:%ld,index:%ld)",section,index ];
    PRImageListViewCell *cell = [[PRImageListViewCell alloc]initWithIndefier:identifier];

    return cell;
}
-(NSInteger)numberOfSectionsInImageListView:(PRImageListView*)imageListView
{
    return 2;
}
-(NSString *)imageListView:(PRImageListView *)imageListView titleForHeaderInSection:(NSInteger)section;
{
    return [NSString stringWithFormat:@"title_%ld",section ];
}

@end
