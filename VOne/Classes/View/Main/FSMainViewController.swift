//
//  FSMainViewController.swift
//  VOne
//
//  Created by 王正一 on 16/7/19.
//  Copyright © 2016年 FsThatOne. All rights reserved.
//

import UIKit

class FSMainViewController: UITabBarController {

    fileprivate lazy var funnyBtn: UIButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViewControllers()
//        rainbowTabbar()
//        setupFunnyButton()
    }
    
    // 设置支持的屏幕方向, 设置之后, 当前控制器和其子控制器都遵循这个道理, modal视图不受影响
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

// MARK: 设置界面
extension FSMainViewController {
    
    fileprivate func setupChildViewControllers() {
        let dictArr = [
            ["name": "SessionsViewController", "title": "聊天", "imageName": "chat"],
            ["name": "ContactViewController", "title": "通讯录", "imageName": "contact"],
            ["name": "MomentsViewController", "title": "圈子", "imageName": "mycircle"],
            ["name": "MineViewController", "title": "个人中心", "imageName": "mine_center"],
        ]
        var controllersArray = [UIViewController]()
        for item in dictArr {
            controllersArray.append(controller(item))
        }
        viewControllers = controllersArray
    }
    
    fileprivate func controller(_ dict: [String: String]) -> UIViewController {
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
    
//    fileprivate func rainbowTabbar() {
//        let rainbowLayer: CAGradientLayer = CAGradientLayer()
//        rainbowLayer.frame = tabBar.bounds
//        rainbowLayer.colors = [UIColor(red:0.244, green:0.673, blue:0.183, alpha:1).cgColor, UIColor(red:0.376, green:0.564, blue:0.984, alpha:1).cgColor]
//        tabBar.layer.insertSublayer(rainbowLayer, at: 0)
//    }
//    
//    fileprivate func setupFunnyButton() {
//        
//        let itemCount = CGFloat(childViewControllers.count)
//        let itemWidth = (tabBar.bounds.width / itemCount) - 1
//        
//        funnyBtn.setBackgroundImage(UIImage(named: "heartBeat")?.withRenderingMode(.alwaysOriginal), for: .normal)
//        funnyBtn.contentMode = .center
//        funnyBtn.frame = tabBar.bounds.insetBy(dx: 2 * itemWidth, dy: 0)
//        
//        tabBar.addSubview(funnyBtn)
//    }
    
}
