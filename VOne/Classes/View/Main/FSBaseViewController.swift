//
//  FSBaseViewController.swift
//  VOne
//
//  Created by 王正一 on 16/7/19.
//  Copyright © 2016年 FsThatOne. All rights reserved.
//

import UIKit

class FSBaseViewController: UIViewController {
    
    // 自定义导航条
    lazy var navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.width(), height: 64))
    //自定义导航条目
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
}

extension FSBaseViewController {
    // 给子类重写的方法
    func setupUI() {
        view.addSubview(navBar)
        navBar.items = [navItem]
    }
}
