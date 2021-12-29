//
//  MovieCell.swift
//  Movieapp
//
//  Created by Smitha Pachauri on 28/12/21.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var lbltitle: UILabel!
    
    @IBOutlet weak var titleDescription: UILabel!
    @IBOutlet weak var lblreleseDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
