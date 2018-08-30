//
//  RootTableViewCell.m
//  Runtime
//
//  Created by 刘冲 on 2018/8/29.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "RootTableViewCell.h"
@import Masonry;

@implementation RootTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self configureViews];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configureViews];
    }
    
    return self;
}

- (void)configureViews {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.titleLabel.font = [UIFont systemFontOfSize:17.0];
    self.titleLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(10.0, 20.0, 10.0, 20.0));
    }];
}

@end
