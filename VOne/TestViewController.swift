//
//  TestViewController.swift
//  VOne
//
//  Created by 王正一 on 16/5/17.
//  Copyright © 2016年 王正一. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK: - test RxSwift
extension TestViewController {
    //    lazy var tableView : UITableView = {
    //        let tab = UITableView(frame: UIScreen.mainScreen().bounds, style: .Plain)
    //        tab.registerClass(UITableViewCell.self, forCellReuseIdentifier: "basicCell")
    //        return tab
    //    }()
    //
    //    let dataSource = Variable([String]())
    //    let disposeBag = DisposeBag()
    //
    //    override func loadView() {
    //        super.loadView()
    //    }
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //
    //        view.addSubview(tableView)
    //
    //        tableView.dataSource = nil
    //        tableView.delegate = nil
    //
    //        dataSource.asObservable()
    //            .map{ $0 }
    //            .bindTo(tableView.rx_itemsWithCellIdentifier("basicCell", cellType: UITableViewCell.self)){ (_, element, cell) in
    //                cell.textLabel?.text = element
    //            }.addDisposableTo(disposeBag)
    //        dataSource.value.appendContentsOf(["刘姐1", "刘姐2", "刘姐3", "刘姐4", "刘姐5", "刘姐6", "刘姐你是不是傻"])
    //    }
}
