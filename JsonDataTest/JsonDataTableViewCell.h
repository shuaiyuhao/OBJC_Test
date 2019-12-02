//
//  JsonDataTableViewCell.h
//  JsonDataTest
//
//  Created by Yuhao on 2019/12/1.
//  Copyright © 2019 Vwidea. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JsonDataTableViewCell : UITableViewCell

+ (CGFloat)cellHeight;
+ (NSString *)cellIdentifier;

- (void)configWithData:(id)data;
@end

NS_ASSUME_NONNULL_END
