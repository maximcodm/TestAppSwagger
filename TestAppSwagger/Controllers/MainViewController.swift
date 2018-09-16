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
    
    private var index = 0
    private let chars = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", ".", ",", "-", "'", "!", "?", ":", ";", "(", ")", "\"", " "]
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
        }
    }
    
    private func parseData(data: Data) {
        let parser = JSONParser(data: data)
        guard let stringData = parser.getString() else { return }
        countOccurenceIn(string: stringData.lowercased())
        DispatchQueue.main.async {
            self.contentTableView.reloadData()
        }
    }
    
    private func countOccurenceIn(string: String) {
        if index < chars.count {
            let array = string.split(separator: Character(chars[index]))
            contentArray.append("<\" \(chars[index].uppercased()) \" - \(array.count - 1) times>")
            index += 1
            countOccurenceIn(string: string)
        } else {
            return
        }
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
