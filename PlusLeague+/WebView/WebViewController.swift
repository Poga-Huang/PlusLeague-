//
//  WebViewController.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/25.
//

import UIKit
import WebKit

class WebViewController: UIViewController{
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loadingActivityView: UIActivityIndicatorView!
    
    var url:URL
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
    var titleText:String?
    var backText:String?
    
    init(url:URL){
        self.url = url
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
        titleLabel.text = titleText
        backBtn.titleLabel?.text = backText
        webView.navigationDelegate = self
        
        loadingView.layer.cornerRadius = loadingView.bounds.width/4
        loadingView.clipsToBounds = true
        isLoading = true
    }
    
    private func initWeb(){
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    //MARK: Actions
    @IBAction func backToPrevious(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func refresh(_ sender: UIButton) {
        isLoading = true
        webView.reload()
    }
    
    
}
