//
//  MainViewController.swift
//  TestAppSwagger
//
//  Created by Maxym on 14.09.2018.
//  Copyright © 2018 maximco. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var contentTableView: UITableView!
    
    private var contentArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        getData()
    }
    
    private func getData() {
        Client.instance.getData { (response) in
            if let error = response.error {
                print(error.localizedDescription)
            }
            self.parseData(data: response.data)
            self.contentTableView.reloadData()
        }
    }
    
    private func parseData(data: Data) {
        let parser = JSONParser(data: data)
        guard let stringData = parser.getString() else { return }
        countOccurenceIn(string: stringData)
    }
    
    private func countOccurenceIn(string: String) {
        
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CONTENT_CELL_ID) as? ContentTableViewCell {
            cell.update(text: contentArray[indexPath.item])
            return cell
        } else {
            return ContentTableViewCell()
        }
    }
}
