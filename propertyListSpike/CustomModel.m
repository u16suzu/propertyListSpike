//
//  CustomModel.m
//  properyListSpike
//
//  Created by u16suzu on 2013/10/10.
//  Copyright (c) 2013年 u16suzu. All rights reserved.
//

#import "CustomModel.h"
#import <objc/runtime.h>

@implementation CustomModel
-(void)p{
    NSLog(@"%@", [self class]);
    
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for(int i=0; i< outCount; i++){
        objc_property_t property = properties[i];
        const char* propName = property_getName(property);
        const char* propType = property_getAttributes(property);
        
        if(propName){
            NSString*pName = [NSString stringWithCString:propName
                                                encoding:[NSString defaultCStringEncoding ]];
            NSString*pAttr = [NSString stringWithCString:propType
                                                encoding:[NSString defaultCStringEncoding]];
            
            NSLog(@"    %@(%@): %@",
                  pName,
                  [self parseType:pAttr],
                  [self valueForKey:pName]);
        }
    }
}

-(NSString*)parseType:(NSString*)pAttr{
    NSArray*components = [pAttr componentsSeparatedByString:@","];
    
    NSMutableString*str = [components[0] mutableCopy];
    [str deleteCharactersInRange:NSMakeRange(0, 1)];
    
    if ([str length] == 1) { // primitive type or id type
        int ascii = [str characterAtIndex:0];
        switch (ascii) {
            case 'i':
                return @"int";
            case 'd':
                return @"double";
            case 'f':
                return @"float";
            case 'c':
                return @"char OR BOOL";
            case '@':
                return @"id";
            default:
                return @"Unknown";
                break;
        }
    }else{ // NSObject type
        return [str componentsSeparatedByString:@"\""][1];
    }
}
@end















