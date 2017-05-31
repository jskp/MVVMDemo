//
//  PublicViewCell.m
//  MVVMDemo
//
//  Created by an on 17/5/31.
//  Copyright © 2017年 hua. All rights reserved.
//

#import "PublicViewCell.h"
#import "UIImageView+WebCache.h"
@interface PublicViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (weak, nonatomic) IBOutlet UITextView *weiboText;

@end
@implementation PublicViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];



}
-(void)setValueVithDic:(PublicModel *)publicModel{
    
    self.nameLabel.text = publicModel.userName;
    self.dataLabel.text = publicModel.date;
    self.weiboText.text = publicModel.text;
    
    
    [_headImage sd_setImageWithURL:publicModel.imageUrl placeholderImage:[UIImage imageNamed:@"loading_1_2"]];
    
}
+(PublicViewCell *)getPublicViewCellWith:(UITableView *)tableView{
 
    
    static NSString *idetify = @"idetify";
    PublicViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idetify];
    if (!cell) {
        cell =  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
        
    }
    return cell;
}

@end
