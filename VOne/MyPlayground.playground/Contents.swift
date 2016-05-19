//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//1.编写一个方法applyTwice(f:(Float -> Float),x:Float) -> Float，以函数f和float值x作为参数，然后用x参数调用f两次。如f(f(x))
func applyTwice(f:(Float -> Float),x:Float) -> Float {
    return f(f(x))
}
let a: Float = applyTwice({ $0*$0 }, x: 3)
//2.编写一个方法applyKTimes(f:(Float -> Float),x:Float) -> Float，以函数f和float值x作为参数，然后用x参数调用f k次。

//3.使用applyKTimes实现x的k次方

//4.给定一个User类数组，类包含属性name:String和age:Int，用map函数返回一个用户name组成的字符串数组
class User {
    var name : String?
    var age : Int?
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
var userArray : [User] = [User(name: "哈哈", age: 3), User(name: "嘻嘻", age: 5), User(name: "嘿嘿", age: 7)]
let returnArray = userArray.map {$0.name!}
returnArray
//5.给定一个Dictionary数组，Dictionary包含key值name和key值age，用map函数返回name字符串数组
var dictArray = [["name":"哈哈", "age":3], ["name":"xixi", "age":7], ["name":"heihei", "age":5], ["name":"hehe", "age":1]]
let returnArr = dictArray.map{$0["name"]!}
returnArr
//6.给定一个Number数组，用filter函数选出奇数
var numArray : [Int] = [1, 5,13,56,23,76,13,97,234,756,211]
let array = numArray.filter({$0%2 != 0})
array
//7.给定一个String数组，用filter函数选出能被转成Int的字符串
var strArray : [String] = ["hehe", "3", "ss", "77"]
let canInt = strArray.filter{ Int($0) != nil}
canInt
//8.给定一个UIView数组，用filter函数选出UILabel的子类

//9.用reduce函数把String数组中元素连接一个字符串，以换行符分隔
//
//10.使用reduce函数找出整形数组中的最大元素
//
//11.为什么不能用reduce实现平均函数{$0 + $1 / Float(array.count)}
//
//12.实现一个reduce功能时，什么属性可以使操作更简单
//
//13.在Swift中实现丘奇数（终级练习，也是最难的）

import RxSwift





