//
//  ViewController.m
//  SearchTest
//
//  Created by alexbutenko on 7/22/14.
//  Copyright (c) 2014 alex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *arrayOfStrings;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //simulate loading some data from server
    
    [self loadDataWithCompletionHandler:^(NSArray *loadedData) {
        self.arrayOfStrings = [loadedData mutableCopy];
        [self.tableView reloadData];
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationItem.titleView = self.searchBar;
}

- (void)loadDataWithCompletionHandler:(void(^)(NSArray *loadedData))block {
    //some retrieving stuff
    
    //simulate network delay and passing data back
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (block) block(@[@"test", @"test2"]);
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayOfStrings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    
    cell.textLabel.text = self.arrayOfStrings[indexPath.row];
    return cell;
}

#pragma mark - UISearchBarDelegate

// called when text changes (including clear)
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    //do some filtering
    
    //we will add additional entry for testing purpose
    if (![self.arrayOfStrings containsObject:@"search attempted"]) {
        [self.arrayOfStrings addObject:@"search attempted"];
        [self.tableView reloadData];
    }
}

@end
