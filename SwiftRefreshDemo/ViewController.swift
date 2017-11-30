//
//  ViewController.swift
//  SwiftRefreshDemo
//
//  Created by 高鑫 on 2017/11/30.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var emojiArray = ["🐶","🐱","🐭","🐰","🐼","🐷","🐵","🦄","🐔","🐮"]
    let refreshEmojiArray = ["😀😀😀","😂😂😂","😘😘😘","😎😎😎","🙄🙄🙄"]
    var refreshControl = UIRefreshControl()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView()
        
        tableView.refreshControl = self.refreshControl
        self.refreshControl.backgroundColor = UIColor.clear
        self.refreshControl.attributedTitle = NSAttributedString(string: "正在刷新")
        self.refreshControl.tintColor = UIColor.darkGray
        self.refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        cell.emojiLabel.text = emojiArray[indexPath.row]
        return cell
    }
    
    @objc func refreshAction() {
        let arcCount = UInt32(self.refreshEmojiArray.count)
        let arc = Int(arc4random() % arcCount)
        self.emojiArray.insert(refreshEmojiArray[arc], at: 0)
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }


}

class TableViewCell: UITableViewCell {
    @IBOutlet weak var emojiLabel: UILabel!
}

