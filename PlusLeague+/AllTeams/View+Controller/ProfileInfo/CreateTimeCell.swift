//
//  CreateTimeCell.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/7/2.
//

import UIKit

class CreateTimeCell: UITableViewCell {
    
    
    @IBOutlet weak var createTimeLabel: UILabel!
    
    func setupCreateTimeCell(timeText:String){
        createTimeLabel.text = "成立時間：\(timeText)"
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
