//
//  Room.m
//  W4D5-RealmTest
//
//  Created by Murat Ekrem Kolcalar on 11/24/17.
//  Copyright © 2017 murtilicious. All rights reserved.
//

#import "Room.h"

@implementation Room

- (instancetype) initWithName: (NSString*)name {
    if (self = [super init]) {
        _roomName = name;
    }
    return self;
}

@end
