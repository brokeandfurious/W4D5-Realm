//
//  Furniture.m
//  W4D5-RealmTest
//
//  Created by Murat Ekrem Kolcalar on 11/24/17.
//  Copyright © 2017 murtilicious. All rights reserved.
//

#import "Furniture.h"

@implementation Furniture

- (instancetype) initWithName: (NSString*)name {
    if (self = [super init]) {
        _furnitureName = name;
    }
    return self;
}

@end
