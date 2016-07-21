//
//  DetailViewController.swift
//  GameApp
//
//  Created by Khanh Nguyen on 7/12/16.
//  Copyright © 2016 Khanh Nguyen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var gametitlelabel: UILabel!
    
    @IBOutlet weak var numberofplayerslabel: UILabel!
    
    @IBOutlet weak var descriptiontext: UITextView!
    
    
    

    var detailItem: NSDictionary? {
        didSet {
            // Update the view.
            
        }
        
        
        
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            
            gametitlelabel.text = detailItem!["Game"] as! String
            let numOfPlayers = detailItem!["# of Players"] as! Double
            let numToShow : String = parseNumberOfPlayers(numOfPlayers)
            numberofplayerslabel.text = numToShow
            descriptiontext.text = detailItem!["Rules"] as! String

        }
    }
    
    func parseNumberOfPlayers(numbers : Double) -> String {
        var returnString : String  = ""
        let lowerBound: Int = Int(numbers)
        let upperBound: Int = Int(numbers * 100) % 100
        if upperBound == 15
        {returnString = String(lowerBound) + "-" + String(upperBound) + "+"}
        else if upperBound == 0
        {returnString = String(lowerBound)}
        else
        {returnString = String(lowerBound) + "-" + String(upperBound)}
        
        return returnString
        
    
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

