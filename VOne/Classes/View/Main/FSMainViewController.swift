//
//  FSMainViewController.swift
//  VOne
//
//  Created by 王正一 on 16/7/19.
//  Copyright © 2016年 FsThatOne. All rights reserved.
//

import UIKit

class FSMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white()
        tabBar.barTintColor = UIColor.white()
        setupChildViewControllers()
    }

}

// MARK: 设置界面
extension FSMainViewController {
    
    private func setupChildViewControllers() {
        let dictArr = [
            ["name": "SessionsViewController", "title": "聊天", "imageName": "chat"],
            ["name": "ContractViewController", "title": "通讯录", "imageName": "contact"],
            ["": ""],
            ["name": "MomentsViewController", "title": "圈子", "imageName": "mycircle"],
            ["name": "MineViewController", "title": "个人中心", "imageName": "mine_center"],
        ]
        var controllersArray = [UIViewController]()
        for item in dictArr {
            controllersArray.append(controller(dict: item))
        }
        viewControllers = controllersArray
    }
    
    private func controller(dict: [String: String]) -> UIViewController {
        // 配置字典内容
        guard let vcName = dict["name"],
            let vcTitle = dict["title"],
            let vcImage = dict["imageName"],
            // 反射机制取得vc
            let cls = NSClassFromString(Bundle.main.nameSpace + "." + vcName) as? FSBaseViewController.Type
        else {
            return UIViewController()
        }
        // 根据字典内容设置UI
        let vc = cls.init()
        vc.title = vcTitle
        vc.tabBarItem.image = UIImage(named: vcImage)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: vcImage)

        let nav = FSNavigationController(rootViewController: vc)
        
        return nav
    }
    
}
