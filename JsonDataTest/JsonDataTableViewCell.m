//
//  JsonDataTableViewCell.m
//  JsonDataTest
//
//  Created by Yuhao on 2019/12/1.
//  Copyright © 2019 Vwidea. All rights reserved.
//

#import "JsonDataTableViewCell.h"
#import <Masonry.h>
#import "JsonModel.h"

@interface JsonDataTableViewCell ()

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *valueLabel;

@end

@implementation JsonDataTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.valueLabel];
        
        [self layoutPageViews];
    }
    return self;
}

- (void)layoutPageViews {
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@20);
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(10);
    }];
    
    [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@20);
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-10);
    }];
}

+ (CGFloat)cellHeight {
    return 44.f;
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}


- (void)configWithData:(id)data {
    if (data && [data isKindOfClass:[JsonModel class]]) {
        JsonModel *model = data;
        self.nameLabel.text = model.name;
        self.valueLabel.text = model.value;
    }
}
#pragma mark -- setter and getter
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.text = @"testName";
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _nameLabel;
}

- (UILabel *)valueLabel {
    if (!_valueLabel) {
        _valueLabel = [UILabel new];
        _valueLabel.text = @"testValue";
        _valueLabel.textAlignment = NSTextAlignmentRight;
    }
    return _valueLabel;
}


@end
