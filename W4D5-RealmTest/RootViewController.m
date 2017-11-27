//
//  RootViewController.m
//  W4D5-RealmTest
//
//  Created by Murat Ekrem Kolcalar on 11/24/17.
//  Copyright © 2017 murtilicious. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tableDataArray = [Room allObjects];
    [_tableView reloadData];
}

#pragma UI STUFF
- (IBAction)addRoomButtonPressed:(id)sender {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Add Room"
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Room Name";
        textField.secureTextEntry = NO;
    }];
    
    UIAlertAction *confirmAction = [UIAlertAction
                                    actionWithTitle:@"OK"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * _Nonnull action) {
                                        NSString *roomInput = alertController.textFields[0].text;
//                                        Room *createdRoom = [[Room alloc] initWithName:roomInput];
//                                        NSLog(@"input was '%@'", createdRoom.roomName);
                                        [self insertRoomIntoDataBaseWithName:roomInput];
    }];
    [alertController addAction:confirmAction];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

#pragma REALM STUFF
-(void)insertRoomIntoDataBaseWithName:(NSString *)name
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    Room *room = [[Room alloc] init];
    room.roomName=name;
    [realm addObject:room];
    [realm commitWriteTransaction];
    [_tableView reloadData];
}

#pragma TABLE STUFF
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Rooms";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableDataArray count];
}

- (CustomTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Room *room = [tableDataArray objectAtIndex:indexPath.row];
    cell.cellLabel.text = room.roomName;
    self.heldRoom = room;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController respondsToSelector:@selector(setSeguedRoom:)]) {
        [segue.destinationViewController performSelector:@selector(setSeguedRoom:)
                                              withObject:self.heldRoom];
    }
}

@end
