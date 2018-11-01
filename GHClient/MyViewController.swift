//
//  MyViewController.swift
//  GHClient
//
//  Created by zengge  on 2018/11/1.
//  Copyright © 2018 com.thoughtworks.workshop. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
//        cell.textLabel?.text = "ddd"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as? MyUITableViewCell else {
            return UITableViewCell() //如果为空则直接return UITableViewCell() 下面的代码都不会走
        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as! MyUITableViewCell  如果是nil就废了
        let event: Event = FakeDataProvider().providerData()[indexPath.row]
        cell.configure(event: event)
        return cell
    }
    
    private let identify = "table-cell"
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.register(MyUITableViewCell.self, forCellReuseIdentifier: "abc")
        tableView.register(UINib(nibName: "MyUITableViewCell", bundle: nil), forCellReuseIdentifier: identify)
    }
    

}
