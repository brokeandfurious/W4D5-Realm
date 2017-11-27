//
//  RoomViewController.m
//  W4D5-RealmTest
//
//  Created by Murat Ekrem Kolcalar on 11/26/17.
//  Copyright © 2017 murtilicious. All rights reserved.
//

#import "RoomViewController.h"

@interface RoomViewController ()

@end

@implementation RoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    furnitureDataArray = [Furniture allObjects];
    [_tableView reloadData];
    
    NSLog(@"Segue room test: %@", self.seguedRoom.roomName);
    
}

#pragma UI STUFF
- (IBAction)addFurnitureButtonPressed:(id)sender {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Add Furniture"
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Furniture Name";
        textField.secureTextEntry = NO;
    }];
    
    UIAlertAction *confirmAction = [UIAlertAction
                                    actionWithTitle:@"OK"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * _Nonnull action) {
                                        NSString *furnitureInput = alertController.textFields[0].text;
                                        [self insertFurnitureIntoDataBaseWithName:furnitureInput];
                                        
                                    }];
    [alertController addAction:confirmAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

#pragma REALM STUFF
-(void)insertFurnitureIntoDataBaseWithName:(NSString *)name
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    Furniture *furniture = [[Furniture alloc] init];
    furniture.furnitureName=name;
    [realm addObject:furniture];
    [realm commitWriteTransaction];
    [_tableView reloadData];
}

#pragma TABLE STUFF
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Furnitures";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [furnitureDataArray count];
}

- (FurnitureCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FurnitureCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FurnitureCell" forIndexPath:indexPath];
    Furniture *furniture = [furnitureDataArray objectAtIndex:indexPath.row];
    cell.cellLabel.text = furniture.furnitureName;
    
    return cell;

}

@end
