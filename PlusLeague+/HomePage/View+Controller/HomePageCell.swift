//
//  HomePageCell.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/6/26.
//

import UIKit

class HomePageCell: UITableViewCell {
    
    
    
    @IBOutlet weak var titleNameLabel: UILabel!
    var viewModel:HomeListCellViewModel?
    
    
    //MARK: setup
    func setupCell(viewModel:HomeListCellViewModel){
        
        self.viewModel = viewModel
        titleNameLabel.text = self.viewModel?.itemName
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
