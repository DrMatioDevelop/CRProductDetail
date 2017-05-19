//
//  CRGoodsDetailViewController.m
//  CRGoodsDetail
//
//  Created by d2c_cyf on 17/5/12.
//  Copyright © 2017年 d2c_cyf. All rights reserved.
//

#import "CRGoodsDetailViewController.h"
#import <CRProtocolManager/CRProtocolManager.h>
#import <CRConfirmProductProtocol/CRConfirmProductProtocol.h>

@interface CRGoodsDetailViewController ()
@property(nonatomic , copy) NSString *goodsId;
@property(nonatomic , copy) NSString *goodsName;

@property(nonatomic , strong) UILabel *statusLabel;
@property(nonatomic , strong) UIButton *buyButton;
@end

@implementation CRGoodsDetailViewController

-  (instancetype)initWithGoodsId:(NSString *)goodsId goodsName:(NSString *)goodsName {
    if (self = [super init]) {
        self.goodsId = goodsId;
        self.goodsName = goodsName;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"商品详情";
    
    [self.view addSubview:self.statusLabel];
    [self.view addSubview:self.buyButton];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.statusLabel.frame = CGRectMake(0, 0, 100, 61.8);
    self.statusLabel.center = CGPointMake(self.view.center.x, self.view.center.y - 100);
    
    self.buyButton.frame = CGRectMake(0, 0, 100, 61.8);
    self.buyButton.center = CGPointMake(self.view.center.x, self.view.center.y);
}
#pragma mark - Click
- (void)buyNow:(UIButton *)button {
    id<CRConfirmOrderServiceProtocol> provide = [CRProtocolManager serviceProvideForProtocol:@protocol(CRConfirmOrderServiceProtocol)];
    UIViewController *confirmOrderVc = [provide confirmOrderVIewControllerWithGoodsId:self.goodsId sureComplete:^{
       self.statusLabel.text = @"确认订单成功";
    }];
    if (confirmOrderVc) {
        [self presentViewController:confirmOrderVc animated:YES completion:nil];
    }
}

#pragma mark - Getter / Setter 
- (UILabel *)statusLabel {
    if (!_statusLabel) {
        _statusLabel = [[UILabel alloc] init];
        _statusLabel.textColor = [UIColor redColor];
        _statusLabel.textAlignment = NSTextAlignmentCenter;
        _statusLabel.text        = @"暂未购买";
    }
    return _statusLabel;
}
- (UIButton *)buyButton {
    if (!_buyButton) {
        _buyButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_buyButton setTitle:@"立即购买" forState:UIControlStateNormal];
        [_buyButton addTarget:self action:@selector(buyNow:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buyButton;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
