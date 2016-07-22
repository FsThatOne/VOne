//
//  UIBarButtonItem+Extension.swift
//  VOne
//
//  Created by 王正一 on 16/7/22.
//  Copyright © 2016年 FsThatOne. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(title: String, target: AnyObject, selector: Selector) {
        let btn = UIButton(type: .system)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.setTitleColor(UIColor.darkGray(), for: .normal)
        btn.setTitleColor(UIColor.red(), for: .highlighted)
        btn.addTarget(target, action: selector, for: .touchUpInside)
        btn.sizeToFit()
        self.init(customView: btn)
    }
}
