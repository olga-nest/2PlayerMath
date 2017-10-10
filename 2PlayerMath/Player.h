//
//  Player.h
//  2PlayerMath
//
//  Created by Olga on 10/9/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, assign) int numberOfLifes;

-(void)looseLife;

@end
