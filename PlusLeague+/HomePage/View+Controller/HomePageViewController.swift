//
//  HomePageViewController.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/25.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var collectionViewBackView: UIView!
    
    internal let viewModel = HomePageViewModel()
    
    private let homePageListTVC = UITableViewController()
    private var coverImageCollectionView:UICollectionView?
    internal var pageControl = UIPageControl()
    
    private var isShowing = false{
        didSet{
            tableViewSwitch(isShowing: !isShowing)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCoverImageCollection()
        createHomePageListTable()
        
        viewModel.url = "https://api.airtable.com/v0/appgXA8nvPn4CjNbP/tblvxuXcUuNvoEhIc?sort[][field]=index"
        
        //Data Binding
        viewModel.onRequestEnd = {
            DispatchQueue.main.async {
                self.homePageListTVC.tableView.reloadData()
                self.coverImageCollectionView?.reloadData()
                self.addPageControl()
            }
        }
        
    }
    
    //MARK: Private Method
    private func createHomePageListTable(){
        homePageListTVC.tableView.dataSource = self
        homePageListTVC.tableView.delegate = self
        
        homePageListTVC.tableView.frame = CGRect(
            x: -(self.view.frame.width/2),
            y: navigationView.frame.maxY,
            width: self.view.frame.width/2,
            height:self.view.frame.height - navigationView.frame.maxY
        )
        homePageListTVC.tableView.register(UINib(nibName: "\(HomePageCell.self)", bundle: nil), forCellReuseIdentifier: "\(HomePageCell.self)")
        
        homePageListTVC.tableView.separatorColor = .white
        homePageListTVC.tableView.backgroundColor = UIColor.getMainColor()
        
        self.view.addSubview(homePageListTVC.tableView)
    }
    
    private func createCoverImageCollection(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: collectionViewBackView.frame.width, height: collectionViewBackView.frame.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        coverImageCollectionView = UICollectionView(frame: collectionViewBackView.bounds, collectionViewLayout: flowLayout)
        coverImageCollectionView?.isPagingEnabled = true
        coverImageCollectionView?.dataSource = self
        coverImageCollectionView?.delegate = self
        
        
        coverImageCollectionView?.register(UINib(nibName: "\(CoverImageCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(CoverImageCell.self)")
        
        if let coverImageCollectionView = coverImageCollectionView {
            collectionViewBackView.addSubview(coverImageCollectionView)
        }
    }
    
    private func addPageControl(){
        pageControl.frame = CGRect(
            x: 0,
            y: collectionViewBackView.bounds.maxY - 44,
            width:collectionViewBackView.bounds.width,
            height: 44)
        pageControl.numberOfPages = (coverImageCollectionView?.numberOfItems(inSection: 0))!
        pageControl.isUserInteractionEnabled = false
        collectionViewBackView.addSubview(pageControl)
    }
    
    
    
    private func tableViewSwitch(isShowing:Bool){
        var x:CGFloat
        if isShowing{
            x = -(self.view.frame.width/2)
        }
        else{
            x = 0
        }
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1, delay: 0, options: [.allowUserInteraction,.curveEaseIn], animations: {
            self.homePageListTVC.tableView.frame.origin.x = x
        }, completion: nil)
    }
    
    //MARK: Actions
    @IBAction func switchToListTable(_ sender: UIButton) {
        isShowing = !isShowing
    }
    

}


