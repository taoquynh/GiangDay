//
//  WebViewViewController.swift
//  DemoWebView
//
//  Created by Taof on 8/28/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
// (1) thêm thư viện WebKit
import WebKit

// (2), kế thừa thư viện WKNavigationDelegate
class WebViewViewController: UIViewController, WKNavigationDelegate {

    // (3) khai báo một biến webView kiểu WKWebView
    var webView: WKWebView!
    
    // (4) gọi phương thức loadView()
    override func loadView() {
        super.loadView()
        
        // khởi tạo webView
        webView = WKWebView()
        
        // gán navigationDelegate cho webView
        webView.navigationDelegate = self
        
        // gán view bằng webView
        view = webView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // (5) khởi tạo url
        let url = URL(string: "https://techmaster.vn")!
        
        webView.load(URLRequest(url: url))
    }

}
