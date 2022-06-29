//
//  HomePage+Extension.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/26.
//

import UIKit
extension HomePageViewController:UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "\(HomePageCell.self)", for: indexPath) as? HomePageCell{
            
            cell.setupCell(viewModel: viewModel.listCellViewModels[indexPath.row])
            return cell
            
        }
        else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0{
            //AllTeams
        }
        else{
            let viewModel = viewModel.listCellViewModels[indexPath.row]
            let webVC = WebViewController(url: viewModel.itemURL, title: viewModel.itemName)
            self.navigationController?.pushViewController(webVC, animated: true)
        }
    }
    
}


extension HomePageViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.coverImageViewModels.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CoverImageCell.self)", for: indexPath) as? CoverImageCell{
            
            let viewModel = viewModel.coverImageViewModels[indexPath.row]
            cell.setupItem(viewModel: viewModel)
            return cell
            
        }
        else{
            return UICollectionViewCell()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / self.view.frame.width)
    }

}
