//
//  RoomViewController.h
//  W4D5-RealmTest
//
//  Created by Murat Ekrem Kolcalar on 11/26/17.
//  Copyright © 2017 murtilicious. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FurnitureCell.h"
#import "Room.h"
#import "Furniture.h"

@interface RoomViewController : UIViewController <UITableViewDataSource>
{
    RLMResults *furnitureDataArray;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) Room *seguedRoom;

@end
