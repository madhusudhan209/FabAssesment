//
//  SharedManager.swift
//  FabAssesment
//
//  Created by Madhusudhan on 19/11/19.
//  Copyright © 2019 BankFab. All rights reserved.
//

import Foundation
import UIKit

/**
 The purpose of the `SharedManager` is to use in this methods in multiple classe's without creating class instance in different classes
 
 The `SharedManager` class is a subclass of the `NSObject`,
 */
class SharedManager: NSObject {
    
    /// single instance object for sharing the code without creating multiples instances
    @objc class var shared : SharedManager{
        
        struct singleton{
            static let instance = SharedManager()
        }
        return singleton.instance
    }
    
        
    /** Checking whether data is avaible or not in Array based that we have to show dataView or NoData available label
     
     - Parameters:
     - noDataLbl: Label
     - tableView: displaying data TableView
     /   - count: Api Response Data passing.
     */
    func showTableOrNoData(_ noDataLbl: UILabel, tableView: UITableView, count: Int) {
        
        if count == 0 {
            noDataLbl.isHidden = false
            tableView.isHidden = true
        }
        else {
            noDataLbl.isHidden = true
            tableView.isHidden = false
        }
        
        tableView.reloadData()
    }
    
}




