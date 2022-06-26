//
//  LaunchViewController.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/24.
//

import UIKit

class LaunchViewController: UIViewController {

    
    //IBOutlet
    @IBOutlet weak var statusBackView: UIView!
    @IBOutlet weak var loadingBackView: UIView!
    @IBOutlet weak var loadingViewsStackView: UIStackView!
    @IBOutlet var startBtn: UIButton!
    @IBOutlet weak var loadingTextLabel: UILabel!
    @IBOutlet var loadingViews: [UIView]!
    
    
    //Variable
    private var showingLoadingViews = [0,1,2,3]
    private var timer:Timer?
    
    private var loadingTimes = 0{
        didSet{
            if loadingTimes == 8{
                //結束loading
                timer?.invalidate()
                loadingBackView.removeFromSuperview()
                addStartBtn()
                timer = Timer.scheduledTimer(timeInterval:0.5, target: self, selector: #selector(lightingBtn), userInfo: nil, repeats: true)
            }
        }
    }
    
    //MARK: ViewCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(loadingViewsAnimating), userInfo: nil, repeats: true)
        
    }
    
    //MARK: Private Method
    
    //初始畫面
    private func initViews(){
        loadingViewsStackView.layer.cornerRadius = loadingViewsStackView.frame.height/2
        loadingViewsStackView.layer.borderWidth = 1
        loadingViewsStackView.layer.borderColor = UIColor.white.cgColor
        loadingTextLabel.text = "Now Loading"
        
        loadingViews.forEach { view in
            view.backgroundColor = .white
            view.alpha = 0
        }
    }
    
    //loading條
    @objc private func loadingViewsAnimating(){
        loadingViews.forEach { view in
            view.alpha = 0
        }
        showingLoadingViews.forEach { index in
            loadingViews[index].alpha = 1
        }
        for index in 0..<showingLoadingViews.count{
            showingLoadingViews[index] += 1
        }
        
        guard var loadingText = loadingTextLabel.text else { return }
        if !(loadingText.contains(".....")){
            loadingText += "."
        }
        else{
            loadingText = "Now Loading"
        }
        loadingTextLabel.text = loadingText
        
        guard var lastNum = showingLoadingViews.last else { return }
        if lastNum == loadingViews.count-1{
            lastNum = 0
            showingLoadingViews.insert(lastNum, at: 0)
            showingLoadingViews.removeLast()
            loadingTimes += 1
        }
    }
    
    //加入按鈕
    private func addStartBtn(){
        startBtn.frame = statusBackView.bounds
        statusBackView.addSubview(startBtn)
    }
    
    //按鈕閃爍動畫
    @objc private func lightingBtn(){
        guard startBtn.alpha == 0 else {
            startBtn.alpha = 0
            return
        }
        startBtn.alpha = 1
    }
    
    private func prepareHomePage(){
        let homePageViewController = HomePageViewController(nibName:"\(HomePageViewController.self)", bundle: nil)
        homePageViewController.modalTransitionStyle = .coverVertical
        homePageViewController.modalPresentationStyle = .fullScreen
        self.dismiss(animated: true) {
            self.present(homePageViewController, animated: true)
        }
    }
    
    //MARK: Actions
    @IBAction func pressStart(_ sender: UIButton) {
        
        timer?.invalidate()
        timer = nil
        
        prepareHomePage()
        
        print("START")
    }
    
    
}
