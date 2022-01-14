//
//  CardTableViewCell.swift
//  HotTakes
//
//  Created by Noman Ahmad on 1/12/22.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    
    let backgroundImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sunset")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
