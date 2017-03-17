//
//  ViewController.swift
//  TableViewSelectData
//
//  Created by 梁雅軒 on 2017/3/17.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var arrData = [MyInfo]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...20 {
            let info = MyInfo()
            info.title = "\(i)"
            arrData.append(info)
        }
        tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        let info = arrData[indexPath.row]
        cell.textLabel?.text = info.title
        cell.backgroundColor = info.isSelect ? UIColor.black : UIColor.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = arrData[indexPath.row]
        info.isSelect = !info.isSelect
        tableView.reloadRows(at: [indexPath], with: .fade)
    }

}

class MyInfo {
    var title:String!
    var isSelect = false
}
