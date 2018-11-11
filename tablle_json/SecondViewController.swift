//
//  SecondViewController.swift
//  tablle_json
//
//  Created by Tonya on 11/11/2018.
//  Copyright © 2018 Tonya. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var newpost: Post?
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.namelabel.text = newpost!.name
        self.textlabel.text = newpost!.description
    }
    
    
    @IBOutlet weak var namelabel: UILabel!
    
    @IBOutlet weak var textlabel: UILabel!
    
}
