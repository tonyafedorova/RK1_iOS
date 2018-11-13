//
//  Post.swift
//  tablle_json
//
//  Created by Tonya on 10/11/2018.
//  Copyright © 2018 Tonya. All rights reserved.
//

import Foundation
import UIKit


struct Post {

    var name = ""
    var type = ""
    var episodes = ""
    var episode_length = ""
    var description = ""
    var imageforsecond: UIImage?

}

extension Post {

    init?(dict: NSDictionary) {
        guard
            let name = dict["name"] as? String,
            let type = dict["type"] as? String,
            let episodes = dict["episodes"] as? String,
            let episode_length = dict["episode_length"] as? String,
            let description = dict["description"] as? String
            else { return nil }

        self.name = name
        self.type = type
        self.episodes = episodes
        self.episode_length = episode_length
        self.description = description
    }
}
