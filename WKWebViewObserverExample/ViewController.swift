//
//  ViewController.swift
//  WKWebViewObserverExample
//
//  Created by wjx on 2018/8/29.
//  Copyright © 2018年 Jiuxing Wang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    var webView: WKWebView!
    var webViewObserver: WKWebViewObserver!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)
        
        webViewObserver = WKWebViewObserver(webView: webView)
            .onChangeEstimatedProgress { observer, progress in
                print("progress: \(progress)")
                
                if progress >= 1.0 {
                    print("progress: \(progress) -- completed.")
                }
            }.onChangeCanGoBack { observer, can in
                print("canGoBack: \(can)")
            }.onChangeCanGoForward { observer, can in
                print("canGoForward: \(can)")
            }.onChangeContentSize { observer, size in
                print("contentSize: \(size)")
            }.onChangeLoading { observer, loading in
                print("loading: \(loading)")
            }.onChangeTitle { observer, title in
                print("title: \(title)")
            }.onChangeURL { observer, url in
                print("url: \(url)")
            }
        
        reload()
    }
    
    fileprivate func reload() {
        let projects = ["KKJSBridge", "WKWebViewObserver", "WJXDateFormatter", "WJXOverlappedImagesView"]
        let index = Int.random(in: 0..<projects.count)
        let projectUrl = "https://github.com/wjiuxing/\(projects[index])"
        let url = URL(string: projectUrl)!
        let request = URLRequest(url: url)
        webView.load(request)
        
        navigationItem.title = "WKWebViewObserver"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(ViewController.resetButtonTouched(_:)))
    }
}


// MARK: - ViewController: Target-Action

extension ViewController {
    @objc func resetButtonTouched(_ barButton: UIBarButtonItem) {
        print("------- reset  -------")
        reload()
    }
}
