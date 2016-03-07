//
//  PlayingCardView.m
//  Matchismo
//
//  Created by iOS Entwickler on 04.03.16.
//  Copyright (c) 2016 noorg. All rights reserved.
//

#import "PlayingCardView.h"

@interface PlayingCardView()
@property (nonatomic) CGFloat faceCardScaleFactor;
@end

@implementation PlayingCardView

#pragma mark - init

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self){
        // init
    }
    return self;
}

- (void)awakeFromNib{
    
    [self setup];
    
}


- (void)setup{
    
    
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
    
}


- (void)pinch: (UIPinchGestureRecognizer *)gesture{
    
    if( (UIGestureRecognizerStateChanged == gesture.state) ||
       (UIGestureRecognizerStateEnded == gesture.state)){
        
        
        self.faceCardScaleFactor *= gesture.scale;
        
        // prevent accumulation
        gesture.scale = 1.0;
    }
}



#pragma mark - drawing


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    
    [roundedRect addClip];
    
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
    
    if(self.faceUp){
        
        UIImage *faceImage = [self loadFaceImageWithRank:[self rankAsString] andSuit:self.suit];
        if(faceImage){
            [self drawFace:faceImage];
        }
        else{
            [self drawPips];
        }
        
        [self drawCorners];
        
    }
    else{
        [[UIImage imageNamed:@"cardback"] drawInRect:self.bounds];
    }
}

- (UIImage *)loadFaceImageWithRank:(NSString *)rank andSuit:(NSString *)suit{
    
    if([@"♥️" isEqualToString:suit]){
        suit = @"H";
    }
    else if([@"♣️" isEqualToString:suit]){
        suit = @"C";
    }
    else if([@"♠️" isEqualToString:suit]){
        suit = @"S";
    }
    else if([@"♦️" isEqualToString:suit]){
        suit = @"D";
    }
    
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@_%@", suit, [self rankAsString]]];
}

- (void)drawFace:(UIImage *)faceImage{
    
    CGRect imageRect = CGRectInset(self.bounds,
                                    self.bounds.size.width * (1.0 - self.faceCardScaleFactor),
                                    self.bounds.size.height * (1.0 - self.faceCardScaleFactor));
    
    [faceImage drawInRect:imageRect];
    
}

- (void)drawPips{
    
    
    
}

- (void)drawCorners{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]];
    
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@", [self rankAsString], self.suit] attributes:@{NSFontAttributeName:cornerFont, NSParagraphStyleAttributeName: paragraphStyle}];
    
    // upper left corner
    CGRect textBounds;
    textBounds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    textBounds.size = [cornerText size];
    [cornerText drawInRect:textBounds];
    
    
    // upper right coner
    textBounds.origin = CGPointMake(self.bounds.size.width - textBounds.size.width - [self cornerOffset], [self cornerOffset]);
    [cornerText drawInRect:textBounds];
    
    // bottom left
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height); // now overall origin is bottom right corner
    CGContextRotateCTM(context, M_PI); // now overall x-axis goes from right to left, and overall y-axis goes from bottom to top
    [cornerText drawInRect:textBounds];
    
    // bottom right
    textBounds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    [cornerText drawInRect:textBounds];
    
}

- (NSString *)rankAsString{
    
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"][self.rank];
}


#define CORNER_FONT_STANDARD_HEIGHT 180.0
#define CORNER_RADIUS 12.0

- (CGFloat)cornerScaleFactor {return self.bounds.size.height / CORNER_FONT_STANDARD_HEIGHT;}
- (CGFloat)cornerRadius {return CORNER_RADIUS * [self cornerScaleFactor];}
- (CGFloat)cornerOffset {return [self cornerRadius] / 3;}


#define DEFAULT_FACE_CARD_SCALE_FACTOR 0.90




#pragma mark - getters and setters

@synthesize faceCardScaleFactor = _faceCardScaleFactor;

- (void)setFaceCardScaleFactor: (CGFloat)faceCardScaleFactor{
    _faceCardScaleFactor = faceCardScaleFactor;
    [self setNeedsDisplay];
}

- (CGFloat)faceCardScaleFactor{
    if(!_faceCardScaleFactor) _faceCardScaleFactor = DEFAULT_FACE_CARD_SCALE_FACTOR;
    return _faceCardScaleFactor;
}


- (void)setRank:(NSUInteger)rank{
    _rank = rank;
    [self setNeedsDisplay];
}

- (void)setSuit:(NSString *)suit{
    _suit = suit;
    [self setNeedsDisplay];
}

- (void)setFaceUp:(BOOL)faceUp{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

@end
