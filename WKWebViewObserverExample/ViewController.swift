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
        
        // FIXME: DON'T forget to use the weak-strong dancing in the event closure to avoid retain cycle.
        
        webViewObserver = WKWebViewObserver(webView: webView)
            .onChangeEstimatedProgress { /*[weak self]*/ observer, progress in
                print("progress: \(progress)")
                
                if progress >= 1.0 {
                    print("progress: \(progress) -- completed.")
                }
            }.onChangeCanGoBack { /*[weak self]*/ observer, can in
                print("canGoBack: \(can)")
            }.onChangeCanGoForward { /*[weak self]*/ observer, can in
                print("canGoForward: \(can)")
            }.onChangeContentSize { /*[weak self]*/ observer, size in
                print("contentSize: \(size)")
            }.onChangeLoading { /*[weak self]*/ observer, loading in
                print("loading: \(loading)")
            }.onChangeTitle { /*[weak self]*/ observer, title in
                print("title: \(title)")
            }.onChangeURL { /*[weak self]*/ observer, url in
                print("url: \(url)")
            }
        
        reload()
    }
    
    fileprivate func reload() {
        let url = URL(string: "https://github.com/wjiuxing")!
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
