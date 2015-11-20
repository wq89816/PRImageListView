//
//  AppDelegate.h
//  MyImageListView
//
//  Created by mac on 15-10-30.
//  Copyright (c) 2015年 Appcoda. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PRImageListView.h"
#import "PRImageListViewCell.h"

@interface AppDelegate : NSObject <NSApplicationDelegate,PRImageListViewDataSource>
@property (weak) IBOutlet PRImageListView *imageListView;


@end

