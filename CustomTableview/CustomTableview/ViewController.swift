//
//  ViewController.swift
//  CustomTableview
//
//  Created by Canadore Student on 2023-03-28.
//  Copyright © 2023 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTable: UITableView!
    struct myCell {
        let title: String
        let imageName: String
    }
    let data: [myCell] = [
    myCell(title: "Item 1", imageName: "myImage"),
    myCell(title: "Item 2", imageName: "myImage"),
    myCell(title: "Item 3", imageName: "myImage"),
    myCell(title: "Item 4", imageName: "myImage"),
    myCell(title: "Item 5", imageName: "myImage")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        myTable.delegate = self
        myTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected \(data[indexPath.row].title)")
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = data[indexPath.row]
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
        CustomTableViewCell
        cell.cellImage.image = UIImage(named: content.imageName)
        cell.cellLabel.text = content.title
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }
}

