//
//  UIScreen+Extension.swift
//  VOne
//
//  Created by 王正一 on 16/7/22.
//  Copyright © 2016年 FsThatOne. All rights reserved.
//

import UIKit

extension UIScreen {
    class func width() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    class func height() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
}
