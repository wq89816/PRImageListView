//
//  PRImageListView.h
//  MyImageListView
//
//  Created by mac on 15-10-30.
//  Copyright (c) 2015年 Appcoda. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PRImageListViewCell.h"
@class PRImageListView;

@protocol PRImageListViewDataSource<NSObject>

-(NSInteger)imageListView:(PRImageListView*)imageListView numberOfItemsInSection:(NSInteger)section;
-(PRImageListViewCell*)imageListView:(PRImageListView *)imageListView cellForItemAtSection:(NSInteger)section cellForItemAtIndex:(NSInteger)index;
-(NSInteger)numberOfSectionsInImageListView:(PRImageListView*)imageListView;
-(NSString *)imageListView:(PRImageListView *)imageListView titleForHeaderInSection:(NSInteger)section;
@end

@interface PRImageListView : NSView
{
    
}

@property(readwrite, retain)id<PRImageListViewDataSource> dataSource;

-(NSInteger)numberOfSections;
-(NSInteger)numberOfItemsInSection:(NSInteger)section;
-(NSString *)titleForHeaderInSection:(NSInteger)section;
-(PRImageListViewCell*)cellForItemAtSection:(NSInteger)section cellForItemAtIndex:(NSInteger)index;
;
@end
