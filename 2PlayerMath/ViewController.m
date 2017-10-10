//
//  ViewController.m
//  2PlayerMath
//
//  Created by Olga on 10/9/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"
#import "Player.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *playerOneCurrentScoreView;
@property (weak, nonatomic) IBOutlet UILabel *playerTwoCurrentScoreView;
@property (weak, nonatomic) IBOutlet UILabel *questionLabelView;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (nonatomic, assign) int result;
@property (nonatomic) NSMutableString *inputString;
@property (nonatomic) NSMutableString *scoreAndLives;

@property (nonatomic) GameModel *gameModel;
@property (nonatomic) Player *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.player = [Player new];
    self.gameModel = [GameModel new];
    self.inputString = [NSMutableString new];
    self.scoreAndLives = [NSMutableString new];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startTheGame:(UIButton *)sender {
    self.questionLabelView.text = [self.gameModel askAdditionQuestion];
}

-(void)showQestion {
    self.questionLabelView.text = [self.gameModel askAdditionQuestion];
}


- (IBAction)inputNumber:(UIButton *)sender {
    NSString *input = [NSString stringWithFormat:@"%lu", sender.tag];
    self.inputString = [[self.inputString stringByAppendingString:input]mutableCopy];
    self.resultLabel.text = self.inputString;
    
}

- (IBAction)enterResult:(id)sender {
    self.result = [self.inputString intValue];
    if (self.result == self.gameModel.answer) {
        self.resultLabel.text = @"Correct!";
        self.inputString = @"";
        
        self.scoreAndLives = [NSMutableString stringWithFormat:@"Player 1. Score: N. Lives left %d", self.player.numberOfLifes];
        self.playerOneCurrentScoreView.text = self.scoreAndLives;
        
        self.questionLabelView.text = [self.gameModel askAdditionQuestion];
        
        
    } else {
        [self.player looseLife];
        self.resultLabel.text = @"Wrong!";
        self.inputString = @"";
        
        self.scoreAndLives = [NSMutableString stringWithFormat:@"Player 1. Score: N. Lives left %d", self.player.numberOfLifes];
        self.playerOneCurrentScoreView.text = self.scoreAndLives;
        
        if (self.player.numberOfLifes > 0) {
            self.questionLabelView.text = [self.gameModel askAdditionQuestion]; }
        else if (self.player.numberOfLifes == 0) {
            self.resultLabel.text = @"Game over!";
        }
    }
}

@end
