//
//  TeamViewCell.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/7/2.
//

import UIKit

class TeamViewCell: UITableViewCell {
    
    
    @IBOutlet weak var teamColorView: UIView!
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    
    var viewModel:TeamViewCellViewModel?
    
    func setupCell(viewModel:TeamViewCellViewModel){
        self.viewModel = viewModel
        
        guard let teamName = self.viewModel?.teamData.fields.name else { return }
        guard let teamColor = self.viewModel?.teamData.fields.teamColor else { return }
        DispatchQueue.main.async {
            self.teamNameLabel.text = teamName
            self.teamLogoImageView.image = UIImage(named:teamName)
            self.teamColorView.backgroundColor = UIColor.getTeamColor(teamColor)
        }
    
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
