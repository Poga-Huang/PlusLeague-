//
//  CoreCell.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/7/2.
//

import UIKit

class CoreCell: UITableViewCell {
    
    
    @IBOutlet weak var coreTextView: UITextView!
    
    func setupCoreCell(coreText:String){
        coreTextView.text = "核心理念\n\n"  + coreText
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
