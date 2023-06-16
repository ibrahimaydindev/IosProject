//
//  TableViewCell.swift
//  FotografPaylasmaUygulamasi
//
//  Created by Texinsight on 3.06.2023.
//

import UIKit

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var imageViewPost: UIImageView!
    
    @IBOutlet weak var emailText: UILabel!
    
    @IBOutlet weak var yorumText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
