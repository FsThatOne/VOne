//
//  MineViewController.swift
//  VOne
//
//  Created by 王正一 on 16/7/21.
//  Copyright © 2016年 FsThatOne. All rights reserved.
//

import UIKit

class MineViewController: FSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setting() {

//        navigationController?.pushViewController(WelcomeVC, animated: true)
    }
}

extension MineViewController {
    
    override func setupUI() {
        super.setupUI()
        navItem.rightBarButtonItem = UIBarButtonItem(title: "设置", target: self, selector: #selector(setting))
        
    }
    
}
