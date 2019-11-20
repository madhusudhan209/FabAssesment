//
//  RootViewController.swift
//  FabAssesment
//
//  Created by Madhusudhan on 19/11/19.
//  Copyright © 2019 BankFab. All rights reserved.
//

import UIKit

/**
 The purpose of the `RootViewController` is to fetch the MostViewed New list from the api and display the details on a tableview cell
 
 There's a matching scene in the *Main.storyboard* file, and in that scene there is a `UITableView` with `UITableViewCell` design. Go to Interface Builder for details.
 
 The `RootViewController` class is a subclass of the `UIViewController`, and it conforms to the `UITableViewDataSource`, `UITableViewDelegate` and `UIScrollViewDelegate`  protocol.
 */
class RootViewController: UIViewController {
    
    /// object that holds Page number of the API
    var currentPageIndex = 1
    
    /// object that holds total service call requests
    var totalPages = 0
    
    /// object that holds service call per page request
    var perPage = 10
    
    /// array object that holds table data
    var newsListArray = [MostViewed]()
    
    /// tableview for displaying the newss list
    @IBOutlet weak var newsTableView: UITableView!
    
    /// label for displaying the message if there is no data
    @IBOutlet weak var noDataLbl: UILabel!

    /// View load method
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        getNewsListFromApi()
        
    }
    
    /**
     News list API calling
     */
    func getNewsListFromApi() {
        
        ServiceManager.shared.callToGetDataFromServer(appendUrlString: MOSTVIEWED_URL, withIndicator: currentPageIndex == 1 ? true : false, completionHandler: { (jsonOutput) in
            
            self.dataBindingToModel(String.checkDictionary(jsonOutput as Any))

        })
    }
    
    /** Api Response Binding to News List Model Class And checking whether Array count is empty or not
     
     If *newsListArray* does not have values then showing Label No Data Available, If *newsListArray* does have values then hidding NoDataLbl and Displaying TableView and Reloading the TableView to Load data in TableView cells UI
     
     - Parameter jsonDictionary: Response json object
     */
    func dataBindingToModel(_ jsonDictionary: NSDictionary) {
        
        let payloadArray = String.checkArray(jsonDictionary["results"] as Any)

        self.newsListArray.removeAll()
        self.newsTableView.contentOffset = CGPoint(x: 0, y: 0)
        
        // insert each item into database
        for i in 0..<payloadArray.count {
            let newsObj = MostViewed(dict: payloadArray.object(at: i) as! [String : Any])
            self.newsListArray.append(newsObj)
        }
        
        #if DEDEBUG
        print(self.newsListArray)
        #endif
        
        SharedManager.shared.showTableOrNoData(self.noDataLbl, tableView: self.newsTableView, count: self.newsListArray.count)
        
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        
        if segue.identifier == DETAILS_IDENTIFIER {
            let detailsVC = segue.destination as? NewsDetailsViewController
            detailsVC?.newsObj = sender as? MostViewed
        }
        
     }
    
    
}

// MARK: - TableView DataSource and Delegate Methods
extension RootViewController: UITableViewDataSource, UITableViewDelegate {
    
    /// To display the number of sections for table
    /// - Parameter tableView: tableView object that displays news list
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// To display number of rows in each section of table
    /// - Parameters:
    ///   - tableView: tableView object that displays news list
    ///   - section: current section index
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsListArray.count
    }
    
    /// To set the values for fields on the each cell of the row
    /// - Parameters:
    ///   - tableView: tableView object that displays news list
    ///   - indexPath: current indexpath object
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Custom_CellID", for: indexPath) as! NewsTVCell
        cell.selectionStyle = .none
        cell.newsObj = newsListArray[indexPath.row]
        
        return cell
    }
    
    /// Click action delegate of table view row.
    /// - Parameters:
    ///   - tableView: tableView object that displays news list
    ///   - indexPath: current indexpath object
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /* navigating to NewsDetailsViewController Screen to display about news details */
        self.performSegue(withIdentifier: DETAILS_IDENTIFIER, sender: newsListArray[indexPath.row])
    }
    
}




