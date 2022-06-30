//
//  HomePageViewController.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/25.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var seasonCoverImageView: SeasonCoverImageView!
    @IBOutlet weak var supportImageView: SupportImageView!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    @IBOutlet weak var pageControlView: UIView!
    
    internal let viewModel = HomePageViewModel()
    
    private let homePageListTVC = UITableViewController()
    internal var pageControl = UIPageControl()
    
    private var isShowing = false{
        willSet{
            tableViewSwitch()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initViews()
        createBannerCollection()
        
        viewModel.url = "https://api.airtable.com/v0/appgXA8nvPn4CjNbP/tblvxuXcUuNvoEhIc?sort[][field]=index"
        
        //Data Binding
        viewModel.onRequestEnd = {
            DispatchQueue.main.async {
                self.seasonCoverImageView.setupImage(viewModel: self.viewModel.seasonCoverImageViewModel!)
                self.supportImageView.setupImage(viewModel: self.viewModel.supportImageViewModel!)
                self.homePageListTVC.tableView.reloadData()
                self.bannerCollectionView.reloadData()
                self.addPageControl()
            }
        }
        
    }
    
    
    //MARK: Private Method
    private func initViews(){
        self.view.frame = UIScreen.main.bounds
        let bigTitle = UIImage(named: "BigTitle")
        let bigTitleView = UIImageView(image: bigTitle)
        bigTitleView.contentMode = .scaleAspectFit
        bigTitleView.isUserInteractionEnabled = true
        bigTitleView.frame = CGRect(
            x: 0,
            y: 0,
            width: self.view.frame.width,
            height: 44)
        let tapEvent = UITapGestureRecognizer(target: self, action: #selector(tableShowSwitch))
        bigTitleView.addGestureRecognizer(tapEvent)
        
        self.navigationItem.titleView = bigTitleView
        
    }
    
    private func createHomePageListTable(completion:@escaping ()->()){
        homePageListTVC.tableView.dataSource = self
        homePageListTVC.tableView.delegate = self
        
        homePageListTVC.tableView.frame = CGRect(
            x: 0,
            y: CGFloat(self.navigationController?.navigationBar.frame.maxY ?? 44),
            width: self.view.frame.width,
            height:self.view.frame.height - CGFloat(self.navigationController?.navigationBar.frame.maxY ?? 44)
        )
        homePageListTVC.tableView.register(UINib(nibName: "\(HomePageCell.self)", bundle: nil), forCellReuseIdentifier: "\(HomePageCell.self)")
        
        homePageListTVC.tableView.separatorColor = .clear
        homePageListTVC.tableView.backgroundColor = .black
        homePageListTVC.tableView.alpha = 0
        
        self.view.insertSubview(homePageListTVC.tableView, at: self.view.subviews.endIndex)
        completion()
    }
    
    private func createBannerCollection(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        bannerCollectionView.collectionViewLayout = flowLayout
        bannerCollectionView.backgroundColor = .clear
        bannerCollectionView.autoresizesSubviews = false
        bannerCollectionView.bounces = false
        bannerCollectionView.isPagingEnabled = true
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self
        
        
        bannerCollectionView.register(UINib(nibName: "\(CoverImageCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(CoverImageCell.self)")
        
    }
    
    private func addPageControl(){
        pageControl.frame = pageControlView.bounds
        pageControl.numberOfPages = (bannerCollectionView.numberOfItems(inSection: 0))
        pageControl.isUserInteractionEnabled = false
        pageControlView.addSubview(pageControl)
    }
    
    
    
    private func tableViewSwitch(){
        
        if isShowing{
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [.allowUserInteraction,.curveEaseIn], animations: {
                self.homePageListTVC.tableView.alpha = 0
            }) { _ in
                self.homePageListTVC.dismiss(animated: true) {
                    self.homePageListTVC.tableView.removeFromSuperview()
                }
            }
        }
        else{
            createHomePageListTable {
                UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [.allowUserInteraction,.curveEaseOut], animations: {
                    self.homePageListTVC.tableView.alpha = 0.9
                }, completion: nil)
            }
        }
    }
    
    @objc private func tableShowSwitch(){
        isShowing = !isShowing
    }

    

}


