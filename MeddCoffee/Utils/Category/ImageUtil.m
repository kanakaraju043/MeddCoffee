//
//  ImageUtil.m
//  MeddCoffee
//
//  Created by KANAKARAJU GANDREDDI on 2/17/18.
//  Copyright © 2018 com.appinov.meddCoffee. All rights reserved.
//

#import "ImageUtil.h"

@implementation ImageUtil

+(UIImage *) drawText:(NSString *) text
              inImage:(UIImage*)  image
              atPoint:(CGPoint)   point
{
    UIFont *font = [UIFont systemFontOfSize:11];
    
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0,0,image.size.width,image.size.height)];
    CGRect rect = CGRectMake(0, point.y+7, image.size.width, image.size.height/2);
    [[UIColor blueColor] set];
    
    NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *textAttributes = @{NSFontAttributeName: font, NSParagraphStyleAttributeName:paragraphStyle};
    
    [text drawInRect:rect withAttributes:textAttributes];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
