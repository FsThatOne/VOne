//
//  LoginViewController.swift
//  VOne
//
//  Created by 王正一 on 16/11/23.
//  Copyright © 2016年 FsThatOne. All rights reserved.
//

import UIKit

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
        
    }

    override func setupUI() {
        //登陆框猫头鹰图
        loginImg = UIImageView(frame: CGRect(x: mainSize.width / 2 - 211 / 2, y: 100, width: 211, height: 109))
        loginImg!.image = UIImage(named: "owl-login")
        loginImg!.layer.masksToBounds = true
        view.addSubview(loginImg!)
        
        //输入框容器视图
        loginView = UIView(frame: CGRect(x: 15, y: 200, width: mainSize.width - 30, height: 160))
        loginView!.layer.borderWidth = 1
        loginView!.layer.borderColor = UIColor.black.cgColor
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
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == userName {
            if showType != .fsLoginTypeShow_Pass{
                showType = .fsLoginTypeShow_User
                return
            }
            showType = .fsLoginTypeShow_User
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                self.leftHandGoneImg!.frame = CGRect(x: 61 - self.offsetLeftHand, y: 90, width: 40, height: 60)
                self.rightHandGoneImg!.frame = CGRect(x: self.loginImg!.frame.size.width / 2 + 60, y: 90, width: 40, height: 60)
                self.leftHandImg!.frame = CGRect(x: self.mainSize.width / 2 - 100, y: self.loginView!.frame.origin.y - 22, width: 40, height: 40)
                self.rightHandImg!.frame = CGRect(x: self.mainSize.width / 2 + 62, y: self.loginView!.frame.origin.y - 22, width: 40, height: 40)
            }, completion: { (Bool) -> Void in
            })
            
        }else if textField == passWord {
            if showType != .fsLoginTypeShow_User{
                showType = .fsLoginTypeShow_Pass
                return
            }
            showType = .fsLoginTypeShow_Pass
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                self.leftHandGoneImg!.frame = CGRect(x: self.leftHandGoneImg!.frame.origin.x + self.offsetLeftHand, y: self.leftHandGoneImg!.frame.origin.y - 30, width: self.leftHandGoneImg!.frame.size.width, height: self.leftHandGoneImg!.frame.size.height);
                self.rightHandGoneImg!.frame = CGRect(x: self.rightHandGoneImg!.frame.origin.x - 48, y: self.rightHandGoneImg!.frame.origin.y - 30, width: self.rightHandGoneImg!.frame.size.width, height: self.rightHandGoneImg!.frame.size.height);
                
                self.leftHandImg!.frame = CGRect(x: self.leftHandImg!.frame.origin.x + 65 , y: self.loginView!.frame.origin.y, width: 0, height: 0)
                self.rightHandImg!.frame = CGRect(x: self.rightHandImg!.frame.origin.x - 35, y: self.loginView!.frame.origin.y, width: 0, height: 0)
            }, completion: { (Bool) -> Void in
            })
        }
    }
}
