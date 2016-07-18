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
    
    @IBOutlet weak var descriptionlabel: UILabel!
    
    
    
    
    

    var detailItem: NSDictionary? {
        didSet {
            // Update the view.
            
        }
        
        
        
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            
            gametitlelabel.text = detailItem!["Game"] as! String
            let numbOfPlayers = detailItem!["# of Players"] as! Double
            numberofplayerslabel.text = "\(numbOfPlayers)"
            descriptionlabel.text = detailItem!["Rules"] as! String
            descriptionlabel.numberOfLines = 0
//            descriptionlabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        }
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

