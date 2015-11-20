//
//  PRImageListViewCell.m
//  MyImageListView
//
//  Created by mac on 15-10-30.
//  Copyright (c) 2015年 Appcoda. All rights reserved.
//

#import "PRImageListViewCell.h"

@implementation PRImageListViewCell
-(id)initWithIndefier:(NSString *)identifier
{
    self = [super init];
    if (self){
        self.identifier = identifier;
    }
    return  self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [[NSColor yellowColor]set];
    NSRectFill(dirtyRect);
    
    [self.identifier drawInRect:dirtyRect withAttributes:nil];
    // Drawing code here.
}

@end
