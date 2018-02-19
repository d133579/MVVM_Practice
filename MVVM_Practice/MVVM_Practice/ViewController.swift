//
//  ViewController.swift
//  MVVM_Practice
//
//  Created by 文 on 2018/2/11.
//  Copyright © 2018年 文. All rights reserved.
//

import UIKit

let tbikeUrl = URL(string: "http://tbike.tainan.gov.tw:8081/Service/StationStatus/Json")
let cellId = "cell"

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model:[TBikeSite]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let networkRequest = NetworkRequest.sharedInstance()
        
        networkRequest.downloadData(url: tbikeUrl!, completion: { (result) in
            self.model = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }) { (error) in
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let model = model {
            return model.count
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SiteTableViewCell
        let viewModel = ViewModel(model: model![indexPath.row])
        cell.updateWithPresenfter(presenter: viewModel)
        return cell
    }
}

