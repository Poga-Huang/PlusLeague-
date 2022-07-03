//
//  AllTeamsViewController.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/7/1.
//

import UIKit

class AllTeamsViewController: UIViewController {

    
    @IBOutlet weak var teamsTableView: UITableView!
    
    let viewModel = AllTeamsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        
        viewModel.url = "https://api.airtable.com/v0/appgXA8nvPn4CjNbP/tblBHRH5PaJUO8ST3?sort[][field]=name"
        
        viewModel.onRequestEnd = {
            DispatchQueue.main.async {
                self.teamsTableView.reloadData()
            }
        }
        
    }
    
    private func initViews(){
        self.title = "聯盟隊伍"
        teamsTableView.dataSource = self
        teamsTableView.delegate = self
        teamsTableView.register(UINib(nibName: "\(TeamViewCell.self)", bundle: nil), forCellReuseIdentifier: "teamCell")
        teamsTableView.bounces = false
    }

}
