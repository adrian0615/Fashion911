//
//  WebsiteViewController.swift
//  Fashion911
//
//  Created by Adrian McDaniel on 4/4/17.
//  Copyright © 2017 Adrian McDaniel. All rights reserved.
//
import WebKit
import UIKit

class WebsiteViewController: UIViewController , WKNavigationDelegate {
    
    var webView: WKWebView!
   
    override func loadView() {
        
        webView = WKWebView()
        
        webView.navigationDelegate = self
        view = webView
       
        let url = URL(string: "http://www.loveefashion.com/")
        
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Website"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }

}
