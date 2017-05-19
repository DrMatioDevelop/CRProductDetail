//
//  CRGoodsDetailServiceProvide.m
//  CRGoodsDetail
//
//  Created by d2c_cyf on 17/5/12.
//  Copyright © 2017年 d2c_cyf. All rights reserved.
//

#import "CRGoodsDetailServiceProvide.h"
#import <CRGoodsDetailServiceProtocol/CRGoodsDetailServiceProtocol.h>
#import <CRProtocolManager/CRProtocolManager.h>

#import "CRGoodsDetailViewController.h"
@interface CRGoodsDetailServiceProvide () <CRGoodsDetailServiceProtocol>
@end

@implementation CRGoodsDetailServiceProvide
+ (void)load {
    [CRProtocolManager registServiceProvide:[[self alloc] init] forProtocol:@protocol(CRGoodsDetailServiceProtocol)];
}

- (UIViewController *)goodsDetailViewControllerWithGoodsId:(NSString *)goodsId goodName:(NSString *)goodName {
    CRGoodsDetailViewController *goodDetailVC = [[CRGoodsDetailViewController alloc] initWithGoodsId:goodsId goodsName:goodName];
    return goodDetailVC;
}
@end
