//
//  ViewController.swift
//  Swift_Study
//
//  Created by lichaowei on 14-6-6.
//  Copyright (c) 2014年 company. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var aLabel = UILabel(frame:CGRectMake(50,50,50,50))
        aLabel.text = "nihao"
        aLabel.backgroundColor = UIColor.redColor();
        view.addSubview(aLabel)
        
        var aView = UIView(frame:CGRectMake(100,200,100,100));
        aView.backgroundColor = UIColor.purpleColor();
        view.addSubview(aView);
        
        let btn = UIButton(frame:CGRect(origin: CGPointMake(10.0, 110.0), size: CGSizeMake(150,50)))
        btn.setTitle("button", forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.redColor()
        btn.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
        //学习 swift 语言
        
        println("hello world");
        
        let label = "good job";
        let width = 99;
        let widthLabel = label + String(width)
        
        println(widthLabel)
        
        // [] 创建数组\字典
        
        var arr = ["a","b","c"];
        println(arr[0]);
        arr[1] = "hahah";
        println(arr)
        
        var aDic = [
            "person1":"aBoy",
            "person2":"aGirl"];
        println("字典之前:\(aDic)");
        
        aDic["persion3"] = "unKnown";
        
        println("字典之后:\(aDic)");
        
        let key = "persion3"
        println("根据key取字典中Value:\(aDic[key])");
        
        //方法调用
        buttonClick(btn);
        
        let emptyArray = String[]();
        let emptyDictionary = Dictionary<String,Int>()
        
        //控制流
        
        let aArray = [99,100,98,99,100];
        var sum = 0;
        for a in aArray{
            println(a);
            sum += a;
        }
        println(sum);
        
        // ? 来标记 变量的值是可选的
        // 一个可选的值可能是一个具体的值或者是nil
        
        var optionalString:String? = "variable string";
        optionalString = nil;
        
        var optionalName:String? = "boy";
        var greeting = "hello";
        
        optionalName = nil;
        
        //当 变量的可选择值为nil时，条件判断为false;
        //不为nil时,将值赋给 let 后面的常量
        
        if let name = optionalName{
            println("---- \(name)")
            greeting = "hello \(name)";
        }else
        {
            greeting = "optionalName 为 空";
        }
        
        println(greeting);
        
        //switch 支持任意类型数据及各种比较操作
        //条件匹配之后直接跳出 switch ,不需要 break
        
        let a = "bluee";
        switch a{
        case "red":println(a);
        case "blue":println(a);
        case let test where test.hasSuffix("e"):println(test);
        default: println(a);
        }
        
        let aBigDictionary =
        ["a":[1,2,3],
            "b":[6,5,4],
            "c":[10,9,8]];
        
        for(key,value)in aBigDictionary{
            for aNumber in value
            {
                println(key,aNumber);
            }
        }
        
        //while 循环使用
        
        var whileA = 10;
        while whileA > 5
        {
            whileA -= 1;
            println(whileA);
        }
        
        //for 循环两种方式
        for var i = 0; i < 10 ; i++ {
            println("var:\(i)");
        }
        
        // ..不包含上届, ... 包含上届
        for i in 1..9{
            println("noVar:\(i)");
        }
        
        // 函数 ->指定返回值
        
        var sayWhat = sayHello("lcw", toName: "ting");
        
        println(sayWhat);
        
        var aData = getData();
        println(aData);
        
        var aArra = [2,6,1,9,0,33];
        
        var aMax = getMaxNuber(2,5,7,3,1);
        println(aMax);
        
        println(haha());
        
        //        if hasAnyMatch(10, condition: lessThanTen)
        //        {
        //            println("小于")
        //        }else
        //        {
        //            println("不小于")
        //        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    //    //函数作为参数
    //    func hasAnyMatch(aNumber:Int,condition:Int ->Bool)->Bool
    //    {
    //        if condition(aNumber)
    //        {
    //            return true;
    //        }
    //        return false;
    //    }
    //比较是否小于10
    func lessThanTen(number:Int)->Bool
    {
        return number < 10;
    }
    
    //    func hasAnyMatches(list: Int[], condition: Int -> Bool) -> Bool {
    //        for item in list {
    //            if condition(item) {
    //                return true
    //            }
    //        }
    //        return false
    //    }
    
    //    var numbers = [20, 19, 7, 12]
    //    hasAnyMatches(numbers, lessThanTen)
    
    
    func haha()->String
    {
        return sayHello("boy", toName: "come on");
    }
    
    func sayHello(name:String,toName:String)-> String
    {
        return "\(name) sayHello \(toName)";
    }
    
    func getData()->(Int,Double,Double)
    {
        return (1,1.22,1.33);
    }
    
    func buttonClick(a:UIButton){
        println("click \(a)")
    }
    
    //获取最大值
    func getMaxNuber(numbers:Int ...)->(Int)
    {
        var max = 0;
        for a in numbers
        {
            if a > max
            {
                max = a;
            }
        }
        return max;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

