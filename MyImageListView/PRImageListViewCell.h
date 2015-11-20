//
//  PRImageListViewCell.h
//  MyImageListView
//
//  Created by mac on 15-10-30.
//  Copyright (c) 2015年 Appcoda. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PRImageListViewCell : NSView

@property(retain)NSString *identifier;
-(id)initWithIndefier:(NSString *)identifier;
@end
