//
//  ViewController.m
//  ColorSlide
//
//  Created by Alberto Cordero Arellanes on 26/01/15.
//  Copyright (c) 2015 AlbertoCorderoArellanes. All rights reserved.
//

#import "Home.h"
#import "QuartzCore/QuartzCore.h"

float rojo = 0;
float verde = 0;
float azul = 0;


NSTimer *myTimer;

@interface Home ()


@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    sleep(5);
    //self.Color.layer.masksToBounds = YES;
    //self.Color.layer.cornerRadius = 100;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)blink{
    self.Color.alpha = self.Color.alpha ? 0 : 1;
}

- (void)changeColor{
    self.Color.backgroundColor = [UIColor colorWithRed:(rojo/255) green:(verde/255) blue:(azul/255) alpha:1];
}

- (IBAction)accionRojo:(id)sender {
    rojo = self.sliderRojo.value;
    self.lblRojo.text = [NSString stringWithFormat:@"Rojo: %.f",rojo];
    [self changeColor];
}

- (IBAction)accionVerde:(id)sender {
    verde = self.sliderVerde.value;
    self.lblVerde.text = [NSString stringWithFormat:@"Verde: %.f",verde];
    [self changeColor];
}

- (IBAction)accionAzul:(id)sender {
    azul = self.sliderAzul.value;
    self.lblAzul.text = [NSString stringWithFormat:@"Azul: %.f",azul];
    [self changeColor];
}

- (IBAction)accionAlpha:(id)sender {
    self.sliderAlpha.value = round(self.sliderAlpha.value);
    [myTimer invalidate];
    myTimer = nil;
    self.Color.alpha = 1;
    if(self.sliderAlpha.value){
        myTimer = [NSTimer scheduledTimerWithTimeInterval:(0.5/self.sliderAlpha.value) target:self selector:@selector(blink) userInfo:nil repeats:YES];
    }
}
@end