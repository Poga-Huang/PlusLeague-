//
//  AllTeams+Extension.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/7/2.
//

import UIKit

extension AllTeamsViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.teamViewCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as? TeamViewCell{
            
            let viewModel = viewModel.teamViewCellViewModels[indexPath.row]
            cell.setupCell(viewModel: viewModel)
            
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let viewModel = viewModel.teamViewCellViewModels[indexPath.row]
        let teamVC = TeamViewController(data: viewModel)
        
        self.navigationController?.pushViewController(teamVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height / CGFloat(viewModel.teamViewCellViewModels.count)
    }
    
}
