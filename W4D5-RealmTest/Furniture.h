//
//  Furniture.h
//  W4D5-RealmTest
//
//  Created by Murat Ekrem Kolcalar on 11/24/17.
//  Copyright © 2017 murtilicious. All rights reserved.
//

#import <Realm/Realm.h>

@interface Furniture : RLMObject

@property NSString *furnitureName;

- (instancetype) initWithName: (NSString*)name;

@end
