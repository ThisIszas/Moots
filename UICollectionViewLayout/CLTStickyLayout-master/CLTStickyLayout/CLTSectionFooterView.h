//
//  CLTSectionFooterView.h
//  CLTStickyLayout
//
//  Created by Rocky Young on 2017/3/11.
//  Copyright © 2017年 Rocky Young. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLTProtocol.h"

@interface CLTSectionFooterView : UICollectionReusableView<CLTProtocol>

@property (weak, nonatomic) IBOutlet UILabel *sectionFooterLabel;

@end
