//
//  Post.swift
//  tablle_json
//
//  Created by Tonya on 10/11/2018.
//  Copyright © 2018 Tonya. All rights reserved.
//

import Foundation


struct Post {

    let name: String
    let type: String
    let episodes: String
    let episode_length: String
    let description: String

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
