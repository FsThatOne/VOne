//
//  FSBaseViewController.swift
//  VOne
//
//  Created by 王正一 on 16/7/19.
//  Copyright © 2016年 FsThatOne. All rights reserved.
//

import UIKit

public protocol shakable {
    func shake()
}

extension shakable where Self: UIView {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0,y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0,y: self.center.y))
        layer.add(animation, forKey: "position")
    }
}

public protocol twinkleable {
    func twinkle()
}

extension twinkleable where Self: UIButton {
    func twinkle() {
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 0.5
        }) { (Bool) in
            UIView.animate(withDuration: 0.25, animations: {
                self.alpha = 1.0
            })
        }
    }
}


class FSBaseViewController: UIViewController {
    // tableView 可能有可能没有,因此是可选的
    var tableView: UITableView?
    // 刷新控件
    var refreshControl: UIRefreshControl?
    // 自定义导航条
    lazy var navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.width(), height: 64))
    //自定义导航条目
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // 重写title属性的setter,设置navItem的title
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    //加载数据
    func loadData() {
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension FSBaseViewController {
    // 给子类重写的方法
    func setupUI() {
        setupNavBar()
        setupTableView()
        automaticallyAdjustsScrollViewInsets = false
    }
    
    // 设置表格视图
    fileprivate func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView?.contentInset = UIEdgeInsets(top: navBar.bounds.height, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 49, right: 0)
        // 设置数据源->代理 目的:子类直接实现代理方法
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
        view.insertSubview(tableView!, belowSubview: navBar)
        
        // 实例化刷新控件
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        // 将刷新控件添加到tableView
        tableView?.addSubview(refreshControl!)
    }
    
    // 设置导航条
    fileprivate func setupNavBar() {
        view.addSubview(navBar)
        navBar.items = [navItem]
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
    }
    
}

extension FSBaseViewController: UITableViewDelegate, UITableViewDataSource {
    // 基类准备方法,子类去重写,只是为了保证没有语法错误
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    // 同上
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}




class fooView: UIView {
    convenience init(title: String) {
        self.init()
        setupUI(title: title)
    }
    
    func setupUI(title: String) {
        
    }
}
