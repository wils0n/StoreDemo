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
    
    //MARK: Properties
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
    
    //MARK: Fill data
    func fillCellStore(store:Store) {
        self.name.text = store.name
        self.address.text = store.address
        self.phone.text = store.phone
        
        if let storeURL = store.storeLogoURL {
            self.picture.sd_setImage(with: URL(string: storeURL), placeholderImage: UIImage(named: "macys"))
        }
        
    }
    
}
