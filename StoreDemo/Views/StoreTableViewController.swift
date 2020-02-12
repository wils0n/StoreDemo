//
//  StoreTableViewController.swift
//  StoreDemo
//
//  Created by Wilson on 2/11/20.
//  Copyright © 2020 Wilson. All rights reserved.
//

import UIKit

class StoreTableViewController: UITableViewController {
    
    //MARK: Properties
    private var storesInitial = [Store]()
    let kCellId = "kStoredentifierCell"
    let kSegueDetail = "kShowDetailSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadInitialStores()
    }
    
    //MARK: call to services
    func loadInitialStores(){
        let promise = StoreService.getStores()
        
        promise
            .done({ (data, error) in
                if error != nil {
                    self.showAlert(withTitle: "Ups", message: error?.description ?? Constants.generalMessage.rawValue)
                } else if (data != nil) {
                    self.storesInitial = data!
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }).catch(policy: .allErrors) { error in
                
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.storesInitial.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath)
        
        if let qCell = cell as? StoreTableViewCell {
            
            qCell.fillCellStore(store: self.storesInitial[indexPath.row])
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: kSegueDetail, sender: indexPath);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == kSegueDetail {
            let indexPath = sender as! IndexPath
            let store:Store = self.storesInitial[indexPath.row]
            if let destinationVC = segue.destination as? StoreDetailViewController {
                destinationVC.store = store
            }
        }
    }
    
    //MARK: Helpers
    func showAlert(withTitle title:String, message: String) -> Void {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
                
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
