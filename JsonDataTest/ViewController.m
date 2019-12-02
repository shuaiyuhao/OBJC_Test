//
//  ViewController.m
//  JsonDataTest
//
//  Created by Yuhao on 2019/12/1.
//  Copyright © 2019 Vwidea. All rights reserved.
//
//https://api.letsbuildthatapp.com/jsondecodable/courses
#import "ViewController.h"
#import "JsonDataTableViewCell.h"
#import <YTKNetwork.h>
#import <YYModel.h>
#import "BookListApi.h"
#import "JsonModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,YTKRequestDelegate>

@property (nonatomic,strong) UITableView *myTableView;
@property (nonatomic,strong) NSMutableArray *datas;

@property (nonatomic,strong) BookListApi *listApi;

@property (nonatomic,strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setTitle:@"Json数据测试"];
    [self.view addSubview:self.myTableView];
    
    [self getJsonData];
  
}

//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    [self.listApi start];
//
//}

- (void)getJsonData {
    NSString *urlString = @"https://api.letsbuildthatapp.com/jsondecodable/courses";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       self.datas = [NSArray yy_modelArrayWithClass:[JsonModel class] json:data].yy_modelCopy;
        dispatch_async(dispatch_get_main_queue(), ^{
          [self.myTableView reloadData];
        });
    }] resume];
    
    
}
 
#pragma mark -- YTKRequestDelegate
- (void)requestFinished:(__kindof YTKBaseRequest *)request {
//    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
//        id data = request.responseJSONObject;
//        self.datas = [NSArray yy_modelArrayWithClass:[JsonModel class] json:data].yy_modelCopy;
//        [self.myTableView reloadData];
//    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
//        return;
//    }];
    
//    [request start];
    id data = request.responseJSONObject;
    self.datas = [NSArray yy_modelArrayWithClass:[JsonModel class] json:data].yy_modelCopy;
    [self.myTableView reloadData];
    
   
}


#pragma mark -- UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [JsonDataTableViewCell cellHeight];
}

#pragma mark -- UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JsonDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[JsonDataTableViewCell cellIdentifier] forIndexPath:indexPath];
    
//    [cell configWithData:[self.datas objectAtIndex:indexPath.row]];
    
    return cell;
}


#pragma mark -- setter and getter

- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        
        [_myTableView registerClass:[JsonDataTableViewCell class] forCellReuseIdentifier:[JsonDataTableViewCell cellIdentifier]];
        
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        
    }
    
    return _myTableView;
}

- (BookListApi *)listApi {
    if (!_listApi) {
        _listApi = [[BookListApi alloc] init];
        
        _listApi.delegate = self;
    }
    return _listApi;
}

- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}
@end
