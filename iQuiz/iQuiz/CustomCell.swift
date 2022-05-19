//
//  CustomCell.swift
//  iQuiz
//
//  Created by Patricia Ma on 5/17/22.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var TitleView: UILabel!
    
    @IBOutlet weak var DescriptionView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
