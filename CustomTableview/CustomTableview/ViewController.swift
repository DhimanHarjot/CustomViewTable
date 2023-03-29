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
        let marks: String
        let grade: String
    }
    let data: [myCell] = [
    myCell(title: "Harjot Singh", imageName: "myImage", marks: "85", grade: "A"),
    myCell(title: "Karan Singh", imageName: "myImage", marks: "75", grade: "B"),
    myCell(title: "Arshdeep Singh", imageName: "myImage", marks: "65", grade: "C"),
    myCell(title: "Bani Priya", imageName: "myImage", marks: "90", grade: "A+"),
    myCell(title: "Simran Kaur", imageName: "myImage", marks: "95", grade: "A++")
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
        print("Selected \(data[indexPath.row].marks)")
        print("Selected \(data[indexPath.row].grade)")
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = data[indexPath.row]
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
        CustomTableViewCell
        cell.cellImage.image = UIImage(named: content.imageName)
        cell.cellLabel.text = content.title
        cell.cellMarks.text = content.marks
        cell.cellGrade.text = content.grade
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }
}

