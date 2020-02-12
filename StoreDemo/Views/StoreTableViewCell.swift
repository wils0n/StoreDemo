//
//  StoreTableViewCell.swift
//  StoreDemo
//
//  Created by Wilson on 2/11/20.
//  Copyright © 2020 Wilson. All rights reserved.
//

import Foundation
import SDWebImage

class StoreTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var address: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func fillCellStore(store:Store) {
        self.name.text = store.name
        self.address.text = store.address
        
        self.phone.text = store.phone
        
        self.picture.sd_setImage(with: URL(string: store.storeLogoURL!), placeholderImage: UIImage(named: "macys"))
        
    }
    
}
