//
//  TeamViewController+Extension.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/7/2.
//

import UIKit

extension TeamViewController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ProfileCells.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = ProfileCells.allCases[indexPath.section]
        let cellIdentifier = cellType.rawValue
        let data = getPassData.teamData.fields
        
        switch cellType{
        case .cityCell:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CityCell else { return UITableViewCell() }
            cell.setupCityCell(cityName: data.location)
            return cell
            
        case .sloganCell:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SloganCell else { return UITableViewCell() }
            cell.getImage(url: data.sloganImage[0].url)
            return cell
            
        case .coreCell:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CoreCell else { return UITableViewCell() }
            cell.setupCoreCell(coreText: data.core)
            return cell
            
        case .storyCell:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? StoryCell else { return UITableViewCell() }
            cell.setupStoryCell(storyText: data.story)
            return cell
            
        case .createTimeCell:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CreateTimeCell else { return UITableViewCell() }
            cell.setupCreateTimeCell(timeText: data.createTime)
            return cell
            
        }
        
    }
    
}

extension TeamViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        
        return viewModel.playerCellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playerCell", for: indexPath) as? PlayerCell{
            
            guard let vm = viewModel else { return UICollectionViewCell() }
            
            let teamColor = getPassData.teamData.fields.teamColor
            let viewModel = vm.playerCellViewModels[indexPath.row]
            cell.setupCell(viewModel: viewModel,indexPath: indexPath,color: UIColor.getTeamColor(teamColor))
            return cell
        }
        else{
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let vm = viewModel else { return }
        
        let viewModel = vm.playerCellViewModels[indexPath.row]
        let playerID = viewModel.record.fields.PlayerNumber
        let playerName = viewModel.record.fields.Name
        
        if playerID != "-"{
            let urlString = "https://pleagueofficial.com/player/\(playerID)"
            guard let url = URL(string: urlString) else { return }
            
            let webVC = WebViewController(url: url, title: playerName)
            self.navigationController?.pushViewController(webVC, animated: true)
        }
        else{
            return
        }
    }
    
}
