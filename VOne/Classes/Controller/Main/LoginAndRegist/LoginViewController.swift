//
//  LoginViewController.swift
//  VOne
//
//  Created by 王正一 on 16/11/23.
//  Copyright © 2016年 FsThatOne. All rights reserved.
//

import UIKit
import CallKit

enum FsLoginTypeShow{
    case fsLoginTypeShow_User
    case fsLoginTypeShow_Pass
}

class LoginViewController: FSBaseViewController {

    let mainSize = UIScreen.main.bounds.size
    
    let offsetLeftHand: CGFloat = 60
    
    var showType: FsLoginTypeShow = FsLoginTypeShow.fsLoginTypeShow_User
    
    var loginView: UIView?
    
    var loginImg: UIImageView?
    
    var userName: UITextField?
    
    var passWord: UITextField?
    
    var leftHandImg: UIImageView?
    
    var rightHandImg: UIImageView?
    
    var leftHandGoneImg: UIImageView?
    
    var rightHandGoneImg: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        regist()
    }
    
    func regist() {
        let manager: CXCallDirectoryManager = CXCallDirectoryManager.sharedInstance
        manager.getEnabledStatusForExtension(withIdentifier: "FsThatOne.VOne") { (status, error) in
            if error != nil {
                var msgtitle: String? = nil
                if status == .disabled {
                    msgtitle = "未授权，请在设置->电话授权相关权限"
                } else if status == .unknown {
                    msgtitle = "尚不清楚"
                } else {
                    msgtitle = "已经授权"
                }
                let alert: UIAlertController = UIAlertController(title: "提示", message: msgtitle, preferredStyle: .alert)
                let action: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    
                })
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            } else {
                let alert: UIAlertController = UIAlertController(title: "错误", message: "错误", preferredStyle: .alert)
                let action: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    
                })
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func setupUI() {
        
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        view.addGestureRecognizer(tapGuesture)
        view.backgroundColor = UIColor(red:0.063, green:0.698, blue:0.137, alpha:1)
        
        //登陆框猫头鹰图
        loginImg = UIImageView(frame: CGRect(x: (mainSize.width - 211) / 2, y: 150, width: 211, height: 109))
        loginImg!.image = UIImage(named: "owl-login")
        loginImg!.layer.masksToBounds = true
        view.addSubview(loginImg!)
        
        //输入框容器视图
        loginView = UIView(frame: CGRect(x: 15, y: 250, width: mainSize.width - 30, height: 160))
        loginView!.layer.borderWidth = 0.5
        loginView!.layer.borderColor = UIColor.gray.cgColor
        loginView!.backgroundColor = UIColor.white
        view.addSubview(loginView!)
        
        //用户名
        userName = UITextField(frame: CGRect(x: 30, y: 30, width: loginView!.frame.width - 60, height: 44))
        userName!.delegate = self
        userName!.layer.cornerRadius = 5;
        userName!.layer.borderColor = UIColor.lightGray.cgColor;
        userName!.layer.borderWidth = 0.5;
        userName!.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        userName!.leftViewMode = UITextFieldViewMode.always;
        let imgUser = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        imgUser.image = UIImage(named: "iconfont-user")
        userName!.leftView?.addSubview(imgUser)
        loginView!.addSubview(userName!)
        
        
        //密码
        passWord = UITextField(frame: CGRect(x: 30, y: 90, width: loginView!.frame.width - 60, height: 44))
        passWord!.delegate = self
        passWord!.layer.cornerRadius = 5;
        passWord!.layer.borderColor = UIColor.lightGray.cgColor;
        passWord!.layer.borderWidth = 0.5;
        passWord!.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        passWord!.leftViewMode = UITextFieldViewMode.always;
        let imgPass = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        imgPass.image = UIImage(named: "iconfont-password")
        passWord!.leftView?.addSubview(imgPass)
        loginView!.addSubview(passWord!)
        
        //手rect1
        let rectLeftHand = CGRect(x: mainSize.width / 2 - 100, y: loginView!.frame.origin.y - 22, width: 40, height: 40)
        let rectRightHand = CGRect(x: mainSize.width / 2 + 62, y: loginView!.frame.origin.y - 22, width: 40, height: 40)
        //左手图1
        leftHandImg = UIImageView(frame: rectLeftHand)
        leftHandImg!.image = UIImage(named: "icon_hand")
        view.addSubview(leftHandImg!)
        
        //右手图1
        rightHandImg = UIImageView(frame: rectRightHand)
        rightHandImg!.image = UIImage(named: "icon_hand")
        view.addSubview(rightHandImg!)
        
        //手rect2
        let rectLeftHandGone = CGRect(x: 61 - offsetLeftHand, y: 90, width: 40, height: 60)
        let rectRightHandGone = CGRect(x: loginImg!.frame.size.width / 2 + 60, y: 90, width: 40, height: 60)
        
        //左手图2
        leftHandGoneImg = UIImageView(frame: rectLeftHandGone)
        leftHandGoneImg!.image = UIImage(named: "owl-login-arm-left")
        loginImg!.addSubview(leftHandGoneImg!)
        
        //右手图2
        rightHandGoneImg = UIImageView(frame: rectRightHandGone)
        rightHandGoneImg!.image = UIImage(named: "owl-login-arm-right")
        loginImg!.addSubview(rightHandGoneImg!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension LoginViewController: UITextFieldDelegate {
    // 睁眼睛
    func openEyes() {
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.leftHandGoneImg!.frame = CGRect(x: 61 - self.offsetLeftHand, y: 90, width: 40, height: 60)
            self.rightHandGoneImg!.frame = CGRect(x: self.loginImg!.frame.size.width / 2 + 60, y: 90, width: 40, height: 60)
            self.leftHandImg!.frame = CGRect(x: self.mainSize.width / 2 - 100, y: self.loginView!.frame.origin.y - 22, width: 40, height: 40)
            self.rightHandImg!.frame = CGRect(x: self.mainSize.width / 2 + 62, y: self.loginView!.frame.origin.y - 22, width: 40, height: 40)
        }, completion: { (Bool) -> Void in
        })
    }
    // 蒙眼睛
    func closeEyes() {
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.leftHandGoneImg!.frame = CGRect(x: self.leftHandGoneImg!.frame.origin.x + self.offsetLeftHand, y: self.leftHandGoneImg!.frame.origin.y - 30, width: self.leftHandGoneImg!.frame.size.width, height: self.leftHandGoneImg!.frame.size.height);
            self.rightHandGoneImg!.frame = CGRect(x: self.rightHandGoneImg!.frame.origin.x - 48, y: self.rightHandGoneImg!.frame.origin.y - 30, width: self.rightHandGoneImg!.frame.size.width, height: self.rightHandGoneImg!.frame.size.height);
            
            self.leftHandImg!.frame = CGRect(x: self.leftHandImg!.frame.origin.x + 65 , y: self.loginView!.frame.origin.y, width: 0, height: 0)
            self.rightHandImg!.frame = CGRect(x: self.rightHandImg!.frame.origin.x - 35, y: self.loginView!.frame.origin.y, width: 0, height: 0)
        }, completion: { (Bool) -> Void in
        })
    }
    // 开始输入
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == userName {
            if showType != .fsLoginTypeShow_Pass{
                showType = .fsLoginTypeShow_User
                return
            }
            showType = .fsLoginTypeShow_User
            openEyes()
        } else if textField == passWord {
            if showType != .fsLoginTypeShow_User{
                showType = .fsLoginTypeShow_Pass
                return
            }
            showType = .fsLoginTypeShow_Pass
            closeEyes()
        }
    }
    // 结束输入
    func textFieldDidEndEditing(_ textField: UITextField) {
        showType = .fsLoginTypeShow_User
        openEyes()
    }
    // 强制结束输入状态
    func endEditing() {
        view.endEditing(true)
    }
    
}
