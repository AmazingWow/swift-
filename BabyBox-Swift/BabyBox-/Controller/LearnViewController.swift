//
//  LearnViewController.swift
//  BabyBox-
//
//  Created by wp on 16/4/5.
//  Copyright © 2016年 wp. All rights reserved.
//

import UIKit
//4.导入代理
class LearnViewController: UIViewController ,BB_ImageViewDelegate{
    lazy var imageList = ["颜色","形状","数字","字母","动物"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<self.imageList.count{
            let image = UIImage.init(named:self.imageList[i])
            let imageLabel = BB_ImageView.init(frame: CGRectMake(100, 100, image!.size.width,image!.size.height), image: image!, title: self.imageList[i])
            imageLabel.tag = 100+i
            //5.挂上代理
            imageLabel.delegate = self
             self.view .addSubview(imageLabel)
            
            let pan = UIPanGestureRecognizer.init(target: self, action: "move:")
            imageLabel .addGestureRecognizer(pan)
            
        }
    }
    //移动手势
    func move(sender:UIPanGestureRecognizer){
    
        sender.view?.center = sender.locationInView(self.view)
    }
    
    //override 重写父类的方法
    override func viewWillAppear(animated: Bool) {
        for i in 0..<self.imageList.count{
        let image = UIImage.init(named:self.imageList[i])
        //随机数必须是整数 不同数据类型 不能计算
        let width = UIScreen.mainScreen().bounds.width
        let num = UInt32(width-image!.size.width)
        let rand = arc4random()%num + 50
        let imageLabel = self.view.viewWithTag(100+i) as! BB_ImageView
        imageLabel.frame = CGRectMake(CGFloat(rand), 50.0+(image!.size.height+10.0)*CGFloat(i), image!.size.width, image!.size.height);
        imageLabel.tag = 100+i
        }
    }
    //6.实现代理方法
    func didSelectView(sender: BB_ImageView) {
        print("sadsadasdasdasdasd")
        sender.jamp()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
