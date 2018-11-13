//
//  ViewController.swift
//  tablle_json
//
//  Created by Tonya on 10/11/2018.
//  Copyright © 2018 Tonya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var list = [
        (
            url: "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/attack_on_titan.json",
            image: "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/attack_on_titan.jpg"
        ),
        (
            url: "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/beck.json",
            image: "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/beck.jpg"
        ),
        (
            url: "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/clannad.json",
            image: "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/clannad.jpg"
        ),
        (
            url: "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/code_geass.json",
            image: "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/code_geass.jpg"
        ),
        (
            url: "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/fma.json",
            image: "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/fma.jpg"
        ),
        (
            url: "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/monster.json",
            image: "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/monster.jpg"
        )
    ]
    var selectedrow: Post!
    var text: String!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.labelforcell.text = posts[indexPath.row].name
        cell.imageforcell.image = posts[indexPath.row].imageforsecond
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
        table.delegate = self
        table.dataSource = self
        getPosts()
        

    }
    var posts = [Post]()



    func getPosts() {
        for i in list{
            guard let url = URL(string: i.url) else { return }

            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let data = data else { return }

                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    guard let postDict = json as? NSDictionary,
                        let post = Post(dict: postDict) else { return }
                    self.getimages(url: i.image, postim: post)
                } catch {
                    print(error.localizedDescription)
                }

                }.resume()
        }
    }
    func getimages(url: String, postim: Post){
            guard let url = URL(string: url) else { return }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let data = data else { return }
                if let image = UIImage(data: data) {
                    var newpost = postim
                    newpost.imageforsecond = image
                    self.posts.append(newpost)
                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
                }

            }.resume()
    }
}


