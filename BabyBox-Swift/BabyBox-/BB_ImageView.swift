//
//  BB_ImageView.swift
//  BabyBox-
//
//  Created by wp on 16/4/6.
//  Copyright © 2016年 wp. All rights reserved.
//
/*
1.类型属性
class var 变量名:数据类型 {return 值}
class var 声明的变量 类似全局变量 但是不可赋值 使用类名 调用
2.观察属性
属性中 可设置 willSet didSet 来观察 属性的设置
3.实例属性
在类中声明
懒加载 懒惰属性  lazy 会在使用的时候创建
计算属性  重写set get
公式：lazy var 变量名：数据类型 = 值
*/
import UIKit

//1.声明代理的协议 方法
protocol BB_ImageViewDelegate:NSObjectProtocol{
    
    func didSelectView(sender:BB_ImageView)
}
class BB_ImageView: UIImageView {

    //2.声明代理的属性
    var delegate:BB_ImageViewDelegate?
    
    //声明 titlelLabel属性
    var titlelLabel:UILabel?
    //类型属性
    class var name:NSString{return ""}
    //属性有可能被赋值为nil  所以系统提示 需要init 将属性声明成可选类型

    //计算属性
    

    
    init(frame: CGRect ,image:UIImage,title:NSString) {
        
        //使用类名调用
        print(BB_ImageView.name)
        //类型属性不可以被赋值
//        BB_ImageView.name = " " 可以当做类里面的一个静态参数
        //swift 中 不存在  给一个临时的全局变量 赋值   所以 不可以使用  _age = 20
//        self.age = 30
        super.init(frame: frame)
        //加问号 代表是可选类型  ！代表拆包
        self.image = image
        // .ScaleAspectFill 获取枚举值
        self.contentMode = .ScaleAspectFill
        titlelLabel = UILabel.init(frame: self.bounds)
        // !拆包
        // as 装换对应类型 包含关系
        titlelLabel!.text = title as String;
        titlelLabel!.textColor = UIColor.whiteColor()
        self.titlelLabel!.font = UIFont.systemFontOfSize(25);
        titlelLabel!.shadowColor = UIColor.init(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        titlelLabel!.textAlignment = .Center
        titlelLabel!.adjustsFontSizeToFitWidth = true;
        self.addSubview(titlelLabel!)
        self.userInteractionEnabled = true;
        let tap = UITapGestureRecognizer.init(target: self, action: "action:")
        self.addGestureRecognizer(tap)
    }
    func action(sender:UITapGestureRecognizer){
    
        //3.实现代理方法
    self.delegate!.didSelectView(sender.view as!BB_ImageView)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
