//
//  Player.m
//  2PlayerMath
//
//  Created by Olga on 10/9/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import "Player.h"


@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _numberOfLifes = 3;
    }
    return self;
}


-(void)looseLife {
    self.numberOfLifes = self.numberOfLifes - 1;
}




@end
