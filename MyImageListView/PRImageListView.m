//
//  PRImageListView.m
//  MyImageListView
//
//  Created by mac on 15-10-30.
//  Copyright (c) 2015年 Appcoda. All rights reserved.
//

#import "PRImageListView.h"
#define  PR_ITEM_VIEW_WIDTH 170
#define  PR_ITEM_VIEW_HEIGHT 18

#define  PR_MARGIN_X 40
#define  PR_MARGIN_Y 15


@implementation PRImageListView

-(BOOL)isFlipped
{
    return YES;
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
    NSInteger sectionsCount  = [self numberOfSections];
     CGFloat labelStart_Y = 0;
    for (NSInteger i = 0; i < sectionsCount; i++) {
        CGFloat titleHeight = [self drawTitleForSection:i startMarginY:labelStart_Y];
        labelStart_Y += titleHeight;
        NSInteger itemsCount = [self numberOfItemsInSection:i];
        for (NSInteger j = 0; j< itemsCount; j++) {
           
            PRImageListViewCell *cell = [self cellForItemAtSection:i cellForItemAtIndex:j];
            [self drawCell:cell withSection:i index:j startMarginY:labelStart_Y ];
        }
        CGFloat sectionHeight  = ([self rowIndexOfCount:itemsCount]+1)*(PR_ITEM_VIEW_HEIGHT+PR_MARGIN_Y);
        labelStart_Y += sectionHeight;
        
    }
}
-(CGFloat)drawTitleForSection:(NSInteger)section startMarginY:(CGFloat)start_Y
{
    NSString *title = [self titleForHeaderInSection:section];
    if (title != nil) {
        NSAttributedString *attributedTitle = [[NSAttributedString alloc]initWithString:[self titleForHeaderInSection:section] attributes:nil];
        CGRect paragraphRect = [attributedTitle boundingRectWithSize:NSMakeSize(self.bounds.size.width, self.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine];
        CGFloat labelHeight = paragraphRect.size.height;
        [attributedTitle drawInRect:NSMakeRect(0, start_Y, self.bounds.size.width, labelHeight)];
        return labelHeight;
    }else
    {
        return  0;
    }
   
    

}
-(void)drawCell:(PRImageListViewCell*)cell withSection:(NSInteger)section index:(NSInteger)index startMarginY:(CGFloat)labelStart_Y
{
    [cell drawRect:[self boundOfSubviewAtIndex:index withStartMarginY:labelStart_Y]];
}

//n个ItemView排列时的列数（起始值为1）
-(NSInteger)colCount{
    NSRect bd = self.bounds;
    NSInteger colCn = bd.size.width/(PR_ITEM_VIEW_WIDTH+PR_MARGIN_X);
    return colCn>0?colCn:1;
}

//第cn个ItemView排列时的行号（起始值为0）
-(NSInteger)rowIndexOfCount:(NSInteger)cn{
    return  (cn-1)/[self colCount];
}
//第index个ItemView的bounds设置
-(NSRect)boundOfSubviewAtIndex:(NSInteger)index withStartMarginY:(CGFloat)start_Y{
    //    [self resizeCollectionView];
    NSRect bounds = self.bounds;
    NSInteger colCn = [self colCount];
    NSInteger offset = (bounds.size.width+PR_MARGIN_X - (PR_ITEM_VIEW_WIDTH+PR_MARGIN_X)*colCn)/2;
    
    NSInteger rowIndex = (index-1)/colCn ;
    NSInteger colIndex = (index%colCn)>0 ? (index%colCn):colCn ;
    
    CGFloat x = offset+bounds.origin.x+(colIndex-1)*(PR_ITEM_VIEW_WIDTH+PR_MARGIN_X);
    CGFloat y =  start_Y+rowIndex *(PR_ITEM_VIEW_HEIGHT+PR_MARGIN_Y);
    
    return NSMakeRect(x,y,PR_ITEM_VIEW_WIDTH, PR_ITEM_VIEW_HEIGHT);
    
}


-(NSInteger)numberOfSections;
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(numberOfSectionsInImageListView:)]) {
        return [self.dataSource numberOfSectionsInImageListView:self];
    }else{
        return 1;
    }
}
-(NSInteger)numberOfItemsInSection:(NSInteger)section;
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(imageListView:numberOfItemsInSection:)]) {
        return [self.dataSource imageListView:self numberOfItemsInSection:section];
    }else{
        return 0;
    }
}
-(NSString *)titleForHeaderInSection:(NSInteger)section
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(imageListView:titleForHeaderInSection:)]) {
        return [self.dataSource imageListView:self titleForHeaderInSection:section];
    }else{
        return nil;
    }
}
-(PRImageListViewCell*)cellForItemAtSection:(NSInteger)section cellForItemAtIndex:(NSInteger)index
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(imageListView:cellForItemAtSection:cellForItemAtIndex:)]) {
        return [self.dataSource imageListView:self cellForItemAtSection:section cellForItemAtIndex:index];
    }else{
        return nil;
    }

}
@end
