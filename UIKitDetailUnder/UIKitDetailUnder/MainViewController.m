//
//  MainViewController.m
//  UIKitDetailUnder
//
//  Created by 海龙 on 2017/7/10.
//  Copyright © 2017年 海龙. All rights reserved.
//

#import "MainViewController.h"
#import "ViewDetailBase.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong, nonnull) NSArray *listArray;
@property (nonatomic, strong, nonnull) UITableView *viewDetailTabel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.listArray = @[@"view详解-基本属性-方法"];
    [self.view addSubview:self.viewDetailTabel];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"deatilCellId";
    UITableViewCell *detailCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!detailCell) {
        detailCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        detailCell.detailTextLabel.text = [self.listArray objectAtIndex:indexPath.row];
        detailCell.detailTextLabel.textColor = [UIColor grayColor];
    }
    return detailCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            ViewDetailBase *base = [[ViewDetailBase alloc]init];
            [self.navigationController pushViewController:base animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *)viewDetailTabel
{
    if (!_viewDetailTabel) {
        _viewDetailTabel = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _viewDetailTabel.delegate = self;
        _viewDetailTabel.dataSource = self;
    }
    return _viewDetailTabel;
}

@end
