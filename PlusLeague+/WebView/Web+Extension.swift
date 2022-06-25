//
//  Web+Extension.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/25.
//

import UIKit
import WebKit

extension WebViewController:WKNavigationDelegate{
    
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        isLoading = false
    }
}
