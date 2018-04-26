//
//  CustomCell.m
//  YoGaDemo
//
//  Created by 将离。 on 2018/4/26.
//  Copyright © 2018年 将离。. All rights reserved.
//

#import "CustomCell.h"
#import "UIView+Yoga.h"

@interface CustomView : UIView

@property (nonatomic, strong) UIImageView *custoimageView;

@property (nonatomic, strong) UIView *infoView;



@end

@implementation CustomView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.custoimageView = [UIImageView new];
        self.custoimageView.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.custoimageView];
        
        self.infoView = [UIView new];
        self.infoView.backgroundColor = [UIColor cyanColor];
        [self addSubview:self.infoView];
        
        
    }
    return self;
}

- (void)layoutSubviews
{
    [self configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        //                layout.justifyContent =  YGJustifyCenter;
        layout.flexDirection  =  YGFlexDirectionRow;
        layout.alignItems     =  YGAlignCenter;
        layout.height = 100;
        layout.width = 375;
    }];
    

    [self.custoimageView configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.alignSelf = YGAlignCenter;
        layout.marginLeft = 20;
        layout.height = layout.width = 50;
    }];
    
    [self.infoView configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        
        layout.height = 100;
        layout.flexGrow = 1;
        layout.marginLeft = 20;
    }];
    
    
    
    [self.yoga applyLayoutPreservingOrigin:YES];
}

@end


@interface CustomCell()



@end


@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView configureLayoutWithBlock:^(YGLayout *layout) {
            layout.isEnabled     = YES;
            layout.flexDirection = YGFlexDirectionColumn;
            //        layout.alignContent  = YGAlignCenter;
            layout.flexWrap      = YGWrapWrap;
        }];
        
        CustomView *view = [CustomView new];
        
        [self.contentView addSubview:view];
        
        [self.contentView.yoga applyLayoutPreservingOrigin:YES];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
