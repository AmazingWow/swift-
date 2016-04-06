//
//  AppDelegate.swift
//  BabyBox-
//
//  Created by wp on 16/4/5.
//  Copyright © 2016年 wp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        creatTabBarController()
        window?.makeKeyAndVisible()
        
        return true
    }
    func creatTabBarController(){
    
        let titles = ["识","画","我"]
        let vc = UITabBarController.init()
        vc.viewControllers = [UINavigationController.init(rootViewController: LearnViewController()),UINavigationController.init(rootViewController:PaintingViewController()),UINavigationController.init(rootViewController: UserViewController())]
        
        for i in 0..<titles.count{
            
            let item = vc.tabBar.items![i]
            item.title = titles[i]
            item.image = UIImage.init(named:titles[i])
            
            }
        window?.rootViewController = vc
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

