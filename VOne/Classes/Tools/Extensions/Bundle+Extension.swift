//
//  Bundle+Extension.swift
//  VOne
//
//  Created by 王正一 on 16/7/21.
//  Copyright © 2016年 FsThatOne. All rights reserved.
//

import Foundation

extension Bundle {
    var nameSpace: String {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
