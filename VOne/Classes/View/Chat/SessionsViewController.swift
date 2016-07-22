//
//  SessionsViewController.swift
//  VOne
//
//  Created by 王正一 on 16/7/21.
//  Copyright © 2016年 FsThatOne. All rights reserved.
//

import UIKit

private let cellId = "cellId"

class SessionsViewController: FSBaseViewController {

    private lazy var sessionList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    // 加载会话列表
    override func loadData() {
        for i in 0..<10 {
            sessionList.insert(i.description, at: 0)
        }
    }
}

// MARK: 表格数据源方法
extension SessionsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessionList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = sessionList[indexPath.row]
        return cell
    }
    
}

extension SessionsViewController {
    override func setupUI() {
        super.setupUI()
        // 注册原型cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
}
