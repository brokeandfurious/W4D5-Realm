//
//  RootViewController.h
//  W4D5-RealmTest
//
//  Created by Murat Ekrem Kolcalar on 11/24/17.
//  Copyright © 2017 murtilicious. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoomViewController.h"
#import "CustomTableViewCell.h"
#import "Room.h"
#import "Furniture.h"

@interface RootViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    RLMResults *tableDataArray;
    Room *selectedRoomObject;
    Furniture *selectedFurnitureObject;
}

@property (strong, nonatomic) Room *heldRoom;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
