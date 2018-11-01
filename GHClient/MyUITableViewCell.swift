//
//  MyUITableViewCell.swift
//  GHClient
//
//  Created by zengge  on 2018/11/1.
//  Copyright © 2018 com.thoughtworks.workshop. All rights reserved.
//

import UIKit

class MyUITableViewCell: UITableViewCell {

    @IBOutlet weak var avatarIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    func configure(event: Event) {
      nameLabel.text = event.created_at
    }
    
}
