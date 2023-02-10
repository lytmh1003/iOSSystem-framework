//
//  ViewController.m
//  EffectiveOC
//
//  Created by 李育腾 on 2023/2/8.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSTimer *pollTimer;
@end
static NSArray *staticArray;
@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self block];
//    [self seamlessBridging];
    [self startPolling];
}
- (void)forMethod {
    NSArray *testArray = @[@"kd", @"lbj", @"Curry", @"KW", @"@PG"];
    for (int i = 0; i < testArray.count; i++) {
        // 操作数组
    }
    NSDictionary *textDic = @{@"LA": @"LBJ", @"PHX" :@"KD"};
    NSArray *allKeys = [textDic allKeys];
    for (int i = 0; i < allKeys.count; i++) {
        // 操作字典或集合
    }
}
- (void)NSEnumerator {
 // Array
    NSArray *testArray = @[@"kd", @"lbj", @"Curry", @"KW", @"@PG"];
    NSEnumerator *enumerator = [testArray objectEnumerator];
    // 正向
    id object;
    while ((object = [enumerator nextObject]) != nil) {
        // 操作数组
    }
    
    // 反向
    NSEnumerator *reverseEnum = [testArray reverseObjectEnumerator];
    id object2;
    while ((object2 = [reverseEnum nextObject]) != nil) {
        // 操作数组
    }
    
// Dict And Set
    NSDictionary *textDic = @{@"LA": @"LBJ", @"PHX" :@"KD"};
    NSEnumerator *enumertorDic = [textDic keyEnumerator];
    id key;
    while ((key = [enumertorDic nextObject]) != nil) {
        // 操作字典
        id value = textDic[key];
    }
}
//
- (void)fast {
    NSArray *testArray = @[@"kd", @"lbj", @"Curry", @"KW", @"@PG"];
    for (id object in testArray) {
        //
    }
    NSDictionary *textDic = @{@"LA": @"LBJ", @"PHX" :@"KD"};
    for (id key in textDic) {
        NSLog(@"%@", textDic[key]);
    }
}
- (void)block {
    NSArray *testArray = @[@"kd", @"lbj", @"Curry", @"KW", @"@PG"];
    __block NSInteger x = 2;
    [testArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (x < 4) {
            x++;
            NSLog(@"%@", obj);
            // 等效
            NSLog(@"%@", testArray[idx]);
            *stop = NO;
        } else {
            *stop = YES;
            NSLog(@"x == 4 STOP");
        }
    }];
}
// 无缝桥接
- (void)seamlessBridging {
    NSArray *testArray = @[@"kd", @"lbj", @"Curry", @"KW", @"@PG"];
    CFArrayRef aCFArray = (__bridge  CFArrayRef)testArray;
    NSLog(@"cfArratSize =  %li", CFArrayGetCount(aCFArray));
}

// load 和 initalize
//+ (void)initialize {
//    if (self == [ViewController class]) {
//        staticArray = [NSArray new];
//    }
//}

// NSTimer

- (void)startPolling {
    _pollTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(pDoPoll) userInfo:nil repeats:YES];
    _pollTimer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^{
        
    }];
}
- (void)stopPolling {
    [_pollTimer invalidate];
    _pollTimer = nil;
}
- (void)pDoPoll {
    NSLog(@"poll");
}
// 为啥不实现dealloc？
- (void)dealloc {
    [_pollTimer invalidate];
}
@end
