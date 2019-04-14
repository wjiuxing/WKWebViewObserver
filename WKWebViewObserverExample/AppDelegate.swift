//
//  AppDelegate.swift
//  WKWebViewObserverExample
//
//  Created by wjx on 2018/8/29.
//  Copyright © 2018年 Jiuxing Wang. All rights reserved.
//

import UIKit

// MARK: - AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder {
    
    var window: UIWindow?
}


// MARK: - AppDelegate: UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureWindow()
        
        return true
    }
}


// MARK: - AppDelegate: fileprivate

fileprivate extension AppDelegate {
    
    @discardableResult
    func configureWindow() -> UIWindow {
        let vc = ViewController()
        let nvc = UINavigationController(rootViewController: vc)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = nvc
        window.makeKeyAndVisible()
        
        self.window = window
        
        return window
    }
}
