//
//  UIImage+Extension.swift
//  OneSunChat
//
//  Created by 刘ToTo on 16/2/26.
//  Copyright © 2016年 刘ToTo. All rights reserved.
//

import UIKit

extension UIImage{
    convenience init?(name: String, renderingMode: UIImageRenderingMode) {
        self.init(named: name)
        self.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
    }
    
    class func imageWith(Color color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContext(CGSize(width: 20, height: 20))
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(x: 0, y: 0, width: 20, height: 20))
        let returnImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return returnImg
    }
}

/*
 + (instancetype)imageWithColor:(UIColor *)color {
 UIGraphicsBeginImageContext(CGSizeMake(20, 20));
 CGContextRef ctx = UIGraphicsGetCurrentContext();
 CGContextSetFillColorWithColor(ctx, color.CGColor);
 CGContextFillRect(ctx, CGRectMake(0, 0, 20, 20));
 UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
 UIGraphicsEndImageContext();
 return img;
 }
 */
