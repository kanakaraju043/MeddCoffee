//
//  ImageUtil.h
//  MeddCoffee
//
//  Created by KANAKARAJU GANDREDDI on 2/17/18.
//  Copyright © 2018 com.appinov.meddCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageUtil : UIView
+(UIImage *) drawText:(NSString*) text
              inImage:(UIImage*)  image
              atPoint:(CGPoint)   point;
@end
