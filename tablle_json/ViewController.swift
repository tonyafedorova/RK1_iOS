//
//  ViewController.swift
//  tablle_json
//
//  Created by Tonya on 10/11/2018.
//  Copyright © 2018 Tonya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var index = 0
    
    
    var list = ["https://github.com/techparkios/ios-lectures-fall-2018/blob/master/06/attack_on_titan.json", "https://github.com/techparkios/ios-lectures-fall-2018/blob/master/06/beck.json", "https://github.com/techparkios/ios-lectures-fall-2018/blob/master/06/clannad.json", "https://github.com/techparkios/ios-lectures-fall-2018/blob/master/06/code_geass.json"]
    var listimages = ["attack_on_titan.jpg", "beck.jpg", "clannad.jpg", "code_geass.jpg"]
    
    var selectedrow: Post!
    var text: String!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.labelforcell.text = posts[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        self.selectedrow = posts[indexPath.row]
        performSegue(withIdentifier: "tosecond", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tosecond" {
            let second = segue.destination as! SecondViewController
             second.newpost = selectedrow!
        }
    }
    
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        table.delegate = self
        table.dataSource = self
        getPosts()
        

    }
    var posts = [Post]()

    
    func parsePosts(from json: Any) {
        guard let postDict = json as? NSDictionary,
            let post = Post(dict: postDict) else { return }
        posts.append(post)
    }
    
    
    func getPosts() {
        for i in list{
            guard let url = URL(string: i) else { return }

            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let data = data else { return }

                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    self.parsePosts(from: json)
                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }

                }.resume()
        }
    }
}
