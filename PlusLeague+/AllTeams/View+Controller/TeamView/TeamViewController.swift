//
//  TeamViewController.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/7/2.
//

import UIKit
import MapKit

enum ProfileCells:String,CaseIterable{
    case cityCell = "cityCell"
    case sloganCell = "sloganCell"
    case coreCell = "coreCell"
    case storyCell = "storyCell"
    case createTimeCell = "createTimeCell"
}

class TeamViewController: UIViewController {
    
   
    @IBOutlet weak var teamColorView: UIView!
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamEnNameLabel: UILabel!
    @IBOutlet weak var switchSegmentedControl: UISegmentedControl!
    @IBOutlet weak var teamInfoView: UIView!
    @IBOutlet var linkBtns: [UIButton]!
    
    //場館
    @IBOutlet weak var courtInfoView: UIView!
    @IBOutlet weak var courtNameLabel: UILabel!
    @IBOutlet weak var courtAddressLabel: UILabel!
    @IBOutlet weak var courtMapView: MKMapView!
    //簡介
    @IBOutlet weak var profileTableView: UITableView!
    //球隊陣容
    @IBOutlet weak var lineupCollectionView: UICollectionView!
    
    
    var getPassData:TeamViewCellViewModel
    var viewModel:LineupViewModel?
    
    //MARK: Init
    init(data:TeamViewCellViewModel){
        self.getPassData = data
        super.init(nibName: "\(TeamViewController.self)", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        
        viewModel = LineupViewModel()
        
        viewModel?.onRequestEnd = {
            DispatchQueue.main.async {
                self.lineupCollectionView.reloadData()
            }
        }
        viewModel?.teamID = getPassData.teamData.fields.playerListID
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        viewModel = nil
    }
    
    //MARK: Private Method
    private func initViews(){
        
        self.view.frame = UIScreen.main.bounds
        let data = getPassData.teamData.fields
        self.title = "TEAM"
        teamColorView.backgroundColor = UIColor.getTeamColor(data.teamColor)
        switchSegmentedControl.selectedSegmentTintColor = UIColor.getTeamColor(data.teamColor)
        teamNameLabel.text = data.name
        teamEnNameLabel.text = data.englishName
        teamLogoImageView.image = UIImage(named: "\(data.name)")
        
        linkBtns.forEach { btn in
            btn.configuration?.baseForegroundColor = UIColor.getTeamColor(data.teamColor)
        }
        
        //setup 所有的InfoView
        setupProfileView()
        setupCourtView()
        setupLineupInfoView()
        
        showInfoView(viewIndex: switchSegmentedControl.selectedSegmentIndex)
    }
    
    private func showInfoView(viewIndex:Int){
        //內部全部的subviews都先隱藏
        if teamInfoView.subviews.count > 0{
            teamInfoView.subviews.forEach { view in
                view.isHidden = true
            }
        }
        switch viewIndex{
        case 0:
            profileTableView.isHidden = false
        case 1:
            courtInfoView.isHidden = false
        case 2:
            lineupCollectionView.isHidden = false
        default:
            return
        }
        
    }
    
    private func setupProfileView(){
        profileTableView.dataSource = self
        profileTableView.delegate = self
        
        profileTableView.register(UINib(nibName: "\(CreateTimeCell.self)", bundle: nil), forCellReuseIdentifier: "\(ProfileCells.createTimeCell)")
        profileTableView.register(UINib(nibName: "\(SloganCell.self)", bundle: nil), forCellReuseIdentifier: "\(ProfileCells.sloganCell)")
        profileTableView.register(UINib(nibName: "\(StoryCell.self)", bundle: nil), forCellReuseIdentifier: "\(ProfileCells.storyCell)")
        profileTableView.register(UINib(nibName: "\(CoreCell.self)", bundle: nil), forCellReuseIdentifier: "\(ProfileCells.coreCell)")
        profileTableView.register(UINib(nibName: "\(CityCell.self)", bundle: nil), forCellReuseIdentifier: "\(ProfileCells.cityCell)")
        
    }

    private func setupCourtView(){
        let data = getPassData.teamData.fields
        
        courtNameLabel.text = data.homeCourt
        courtNameLabel.font = UIFont(name: "GenSekiGothic TW", size: 20)
        
        courtAddressLabel.text = "場館地址：\(data.homeCourtAddress)"
        courtAddressLabel.numberOfLines = 0
        courtAddressLabel.font = UIFont(name: "GenSekiGothic TW", size: 15)
        
        courtMapView.setRegion(MKCoordinateRegion(center:
            CLLocationCoordinate2D(
                latitude: data.homeCourtLat,
                longitude: data.homeCourtLong),
            latitudinalMeters: 500,
            longitudinalMeters:500),
            animated: true)
        
        courtMapView.mapType = .hybrid
        let annotation = MKPointAnnotation()
        annotation.coordinate = courtMapView.centerCoordinate
        annotation.title = data.homeCourt
        courtMapView.addAnnotation(annotation)
        
        UserDefaults.standard.set("zh", forKey: "AppleLanguages")
        
    }
    
    private func setupLineupInfoView(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(
            width: lineupCollectionView.frame.width/3 - 16,
            height: 360)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .vertical
        lineupCollectionView.collectionViewLayout = flowLayout
        
        lineupCollectionView.backgroundColor = .clear
        lineupCollectionView.autoresizesSubviews = false
        lineupCollectionView.bounces = false
        lineupCollectionView.dataSource = self
        lineupCollectionView.delegate = self
        
        lineupCollectionView.register(UINib(nibName: "\(PlayerCell.self)", bundle: nil), forCellWithReuseIdentifier: "playerCell")
    }
    
    //MARK: Actions
    
    @IBAction func swtichTeamInfoView(_ sender: UISegmentedControl) {
        showInfoView(viewIndex: sender.selectedSegmentIndex)
    }
    
    @IBAction func goToTicketLink(_ sender: UIButton) {
        
        let data = getPassData.teamData.fields
        let webVC = WebViewController(url: data.ticketLink, title: "售票資訊")
        self.navigationController?.pushViewController(webVC, animated: true)
        
    }
    
    @IBAction func goToTeamStatLink(_ sender: UIButton) {
        
        let data = getPassData.teamData.fields
        let webVC = WebViewController(url: data.teamStat, title: "球隊數據")
        self.navigationController?.pushViewController(webVC, animated: true)
        
    }
    
    @IBAction func goToTeamRecordLink(_ sender: UIButton) {
        
        let data = getPassData.teamData.fields
        let webVC = WebViewController(url: data.teamRecord, title: "球隊紀錄")
        self.navigationController?.pushViewController(webVC, animated: true)
        
    }
    
    
}
