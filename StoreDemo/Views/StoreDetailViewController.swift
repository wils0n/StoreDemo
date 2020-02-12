//
//  StoreDetailViewController.swift
//  StoreDemo
//
//  Created by Wilson on 2/11/20.
//  Copyright © 2020 Wilson. All rights reserved.
//

import UIKit

class StoreDetailViewController: UIViewController {
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    var store:Store?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        
    }
    
    func initView(){
        self.name.text = store?.name
        self.city.text = store?.city
        self.address.text = store?.address
        self.phone.text = store?.phone
        if let storeURL:String = store?.storeLogoURL {
            self.picture.sd_setImage(with: URL(string: storeURL))
        }
        
    }
    
    @IBAction func closeVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
