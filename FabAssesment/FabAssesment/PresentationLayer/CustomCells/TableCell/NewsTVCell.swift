//
//  CustomTVCell.swift
//  FabAssesment
//
//  Created by Madhusudhan on 19/11/19.
//  Copyright © 2019 BankFab. All rights reserved.
//

import UIKit

/**
 The purpose of the `NewsTVCell` is to display the each News - Title, Written By, Published Date
 
 There's a matching scene in the *Main.storyboard* file, and in that scene there is a `NewsTVCell` with `UITableViewCell` design. Go to Interface Builder for details.
 
 The `NewsTVCell` class is a subclass of the `UITableViewCell`.
 */
class NewsTVCell: UITableViewCell {

    /// Label to display the news Title
    @IBOutlet weak var newsTitleLbl: UILabel!
    
    /// Label to display the News Written by Name
    @IBOutlet weak var newsWrittenByLbl: UILabel!
    
    /// Label to the News Published Date
    @IBOutlet weak var newsPublishedDateLbl: UILabel!
    
    /// UIImageView to Display about New picture
    @IBOutlet weak var newImageView: UIImageView!
    
    /// Method that hanlde as soon as the cell displayed, used for any declarations
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    /// Method that hanlde as soon as the cell displayed, used for any declarations
    /// - Parameters:
    ///   - selected: selected boolean object
    ///   - animated: animated boolean object
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Getting News Model Object and Displaying news information in UI
    var newsObj: MostViewed? {
        
        didSet {
            
            newsTitleLbl.textColor = UIColor.titleHeaderColor()
            newsWrittenByLbl.textColor = UIColor.hintColor()
            newsPublishedDateLbl.textColor = UIColor.hintColor()
            
            newsTitleLbl.text = (newsObj?.newsTitle)!
            newsWrittenByLbl.text = (newsObj?.newsByName)!
            newsPublishedDateLbl.text = (newsObj?.newsPublished)!

            if newsObj?.mediaArray.count != 0 {
                newImageView.loadImageUsingCacheUrlString(urlString: (newsObj?.mediaArray[0].imageurl)!)
            }
            
            
        }
        
    }

}
