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
        navigationController?.navigationBar.backgroundColor = UIColor.clear()
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "设置", style: .plain, target: self, action: #selector(setting))
    }
    
    @objc private func setting() {
        navigationController?.pushViewController(FSBaseViewController(), animated: true)
    }
}

extension MineViewController {
    
    override func setupUI() {
        super.setupUI()
        view.backgroundColor = UIColor.orange()
    }
    
}
