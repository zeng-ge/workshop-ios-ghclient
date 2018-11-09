//
//  ViewController.swift
//  ghclient-ios
//
//  Created by Xin Guo  on 2018/10/28.
//  Copyright © 2018 com.thoughtworks.workshop. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  private var events: [Event]?
  private let url: String = "https://api.github.com/users/zeng-ge/received_events"
  
  private let reuseIdentifier = "NewsTableViewCell"
    
    private let networkClient: NetworkClient = NetworkImpl()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    let header = RequestHeaderBuilder().build()
    NetworkImpl().get(url: URL(string: url)!, header: header){ json, error in
        if let err = error {//可以解包err己经不是optional的了
            print(err)
            return
        }
        let decoder = JSONDecoder()
        do {
            let events = try decoder.decode([Event].self, from: json!)
            self.events = events//json!.jsonDataMapModel([Event].self)!
            self.tableView.reloadData()
        } catch{
            print(error)//这是error是catch里面的，它会覆盖外面的
        }
        
    }
  }
}

extension NewsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let events = events{
        return events.count
    }
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //guard后面可以放多个let来操作
    guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? NewsTableViewCell,
        let event = events?[indexPath.row] else {
      return UITableViewCell()
    }
    cell.configure(with: event)
    return cell
  }
}

extension NewsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 75
  }
}
