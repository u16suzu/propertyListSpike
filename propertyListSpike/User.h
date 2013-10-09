//
//  User.h
//  properyListSpike
//
//  Created by u16suzu on 2013/10/05.
//  Copyright (c) 2013年 u16suzu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomModel.h"

@interface User : CustomModel
@property (nonatomic) NSString*name;
@property (nonatomic) NSNumber*age;
@property int height;
@property double weight;
@property BOOL marriage;
@property char initial;
@property id hobby;

+(void)sayHello;
-(void)sayGoodbye;
@end
