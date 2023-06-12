//
//  TableViewController.swift
//  Test_interview
//
//  Created by Raman Kozar on 12/06/2023.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayOfData = [MainResult]()
    let urlRequestString: URL = URL(string: "https://newsapi.org/v2/everything?q=android&from=2019-04-00&sortBy=publi%20shedAt&apiKey=0761544563ac4a43b7ab0cc56b49d932&page=1")!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        arrayOfData.removeAll()
        fillTheDataFromAPI()
        
        tableView.reloadData()
        
    }
    
    func fillTheDataFromAPI() {
        
        MainAPI().downloadDataUsingAPI(urlRequestString) { json, error in
            
            guard let jsonObject = json else {
                print("\(String(describing: error)) of downloading data!")
                return
            }
            
            if let dictionary = jsonObject as? [String: Any],
               let results = dictionary["articles"] as? [[String: Any]] {
                
                DispatchQueue.main.async {
                    
                    results.forEach {
                        
                        var currentTitle: String = ""
                        if let title = $0["title"] as? String {
                            currentTitle = title
                        }
                        
                        let mainStruct = MainResult(title: currentTitle)
                        
                        self.arrayOfData.append(mainStruct)
                        
                    }
                    
                    self.tableView.reloadData()
                    
                }
            }
            
        }
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let currCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell
        else {
            return UITableViewCell()
        }
           
        DispatchQueue.main.async {
            
            let currString = self.arrayOfData[indexPath.row]
            
            guard let finalCurrString = currString.title else {
                return
            }
            
            currCell.fillTheInfo(inputText: finalCurrString)
            
        }
        
        return currCell
        
    }

}
