//
//  WebViewController.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/25.
//

import UIKit
import WebKit

class WebViewController: UIViewController{
    
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loadingActivityView: UIActivityIndicatorView!
    
    var url:URL
    var titleText:String
    internal var isLoading = true{
        didSet{
            loadingView.isHidden = !isLoading
            if isLoading{
                loadingActivityView.startAnimating()
            }
            else{
                loadingActivityView.stopAnimating()
            }
        }
    }
    
    init(url:URL,title:String){
        self.url = url
        self.titleText = title
        super.init(nibName: "\(WebViewController.self)", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        initWeb()
        
    }
    
    //MARK: Private Method
    private func initViews(){
        
        let refreshBtn = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(refresh))
        self.navigationItem.rightBarButtonItem = refreshBtn
        self.title = titleText
        webView.navigationDelegate = self
        
        loadingView.layer.cornerRadius = loadingView.bounds.width/4
        loadingView.clipsToBounds = true
        isLoading = true
    }
    
    private func initWeb(){
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    @objc private func refresh() {
        isLoading = true
        webView.reload()
    }
    
    
}
