//
//  TableViewController.swift
//  PullToRefresh
//
//  Created by admin on 7/23/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var numbers: [Int] = Array(1...10).reversed()
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl =  UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector( sortArray), for: UIControlEvents.valueChanged)
      // tableView.addSubview(refreshControll)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numbers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = String(numbers[indexPath.row])

        return cell
    }
    //chen them vao dau
    @objc func sortArray (_refreshControll: UIRefreshControl) {
        let firstnumber = numbers.first!
        numbers.insert(firstnumber + 1, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
        refreshControl?.endRefreshing()
    }

//LOAD MORE

//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let lastNumber = numbers.count - 1
//        if lastNumber == indexPath.row {
//            loadMore()
//        }
//    }
//
//    func loadMore() {
//        let lastNUmber = numbers.last!
//        numbers.append(lastNUmber + 1)
//        tableView.insertRows(at: [IndexPath(row: numbers.count, section: 0)], with: .fade)
//        tableView.reloadData()
//    }
    

}
