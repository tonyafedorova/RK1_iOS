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
    var animage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.namelabel.text = newpost!.name
        self.textlabel.text = newpost!.description
        self.episodes.text = "Количество эпизодов: \(newpost!.episodes)"
        self.length.text = "Длина серии: \(newpost!.episode_length)"
        self.typeof.text = "Тип аниме: \(newpost!.type)"
        if let imag = newpost?.imageforsecond{
            self.imageforsecond.image = imag
        }
    }
    
    
    @IBOutlet weak var namelabel: UILabel!
    
    @IBOutlet weak var textlabel: UILabel!
    
    @IBOutlet weak var imageforsecond: UIImageView!
    
    @IBOutlet weak var typeof: UILabel!
    
    @IBOutlet weak var episodes: UILabel!
    
    @IBOutlet weak var length: UILabel!
    
}
