//
//  StoryCell.swift
//  PlusLeague+
//
//  Created by 黃柏嘉 on 2022/7/2.
//

import UIKit

class StoryCell: UITableViewCell {
    
    @IBOutlet weak var storyTextView: UITextView!
    
    func setupStoryCell(storyText:String){
        storyTextView.text = "球隊故事\n\n" + storyText
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
