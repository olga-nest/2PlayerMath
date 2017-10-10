//
//  GameModel.m
//  2PlayerMath
//
//  Created by Olga on 10/9/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import "GameModel.h"

@interface GameModel()

@property (nonatomic, assign) int rightvalue;
@property (nonatomic,assign) int leftvalue;
@property (nonatomic) NSString *question;


@end


@implementation GameModel

-(NSString *) askAdditionQuestion {
    
    self.rightvalue = arc4random_uniform(20) + 1;
    self.leftvalue = arc4random_uniform(20) + 1;
    
    self.question = [NSString stringWithFormat:@"%li + %li = ", (long)self.rightvalue, (long)self.leftvalue];
    self.answer = self.rightvalue  + self.leftvalue;
    
    return self.question;
}

@end
