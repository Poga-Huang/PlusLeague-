//
//  PlayerCell.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/7/3.
//

import UIKit

class PlayerCell: UICollectionViewCell {

    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var englishNameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var backNumberLabel: UILabel!
    @IBOutlet weak var heightWeightLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    
    var viewModel:PlayerCellViewModel?
    
    
    func setupCell(viewModel:PlayerCellViewModel,indexPath:IndexPath,color:UIColor){
        self.viewModel = viewModel
        
        guard let field = self.viewModel?.record.fields else { return }
        
        nameLabel.text = field.Name
        englishNameLabel.text = field.EnglishName
        backNumberLabel.text = field.BackNumber
        birthdayLabel.text = field.Birthday
        heightWeightLabel.text = field.Height + "/" + field.Weight
        positionLabel.text = field.Position
        colorView.backgroundColor = color
        
        if indexPath.row == field.index{
            self.viewModel?.downloadImageEnd = { image in
                DispatchQueue.main.async {
                    self.playerImageView.image = image
                }
            }
        }
        else{
            playerImageView.image = nil
        }
        
        self.viewModel?.getImage()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        playerImageView.image = UIImage(named: "無名")
        colorView.layer.cornerRadius = 10
        
    }

}
