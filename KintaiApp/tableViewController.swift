//
//  tableViewController.swift
//  KintaiApp
//
//  Created by 高木克 on 2022/07/23.
//

import UIKit

class tableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let times: [String] = ["10時", "11時", "12時"]
    let others: [String] = ["その他", "そのた"]
    let tests: [String] = ["test"]
    let sections: [String] = ["時間", "その他", "test"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    セクションの数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
        
//    セクションのタイトルを返す
    func tableView(_ tableView: UITableView,titleForHeaderInSection section: Int) -> String? {
        return sections[section] as? String
    }
    
//    テーブルに表示する配列の総数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return times.count
        } else if section == 1 {
            return others.count
        } else if section == 2 {
            return tests.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel!.text = times[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel!.text = others[indexPath.row]
        } else if indexPath.section == 2 {
            cell.textLabel!.text = tests[indexPath.row]
        }
        return cell
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
