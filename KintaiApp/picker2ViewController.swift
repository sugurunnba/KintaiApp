//
//  picker2ViewController.swift
//  KintaiApp
//
//  Created by 高木克 on 2022/07/23.
//

import UIKit

class picker2ViewController: UIViewController,UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!    
    //pickerViewに表示する配列を作成
    let list1:[String] = ["10","に","さん","よん","ご",]
    let list2:[String] = ["45","2","3","4","5","6","7"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "sampleTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! sampleTableViewCell
//        if indexPath.section == 0 {
//            cell.textLabel!.text = times[indexPath.row]
//        } else if indexPath.section == 1 {
//            cell.textLabel!.text = others[indexPath.row]
//        } else if indexPath.section == 2 {
//            cell.textLabel!.text = tests[indexPath.row]
//        }
        cell.kanaTextField.text = "あ"
        cell.dateTextField.text = "i"
        cell.numberTextField.text = "う"
        cell.makePickerKeybord(cellce: cell)
        return cell
    }
}

// MARK: - キーボードにと閉じるボタンを付ける
//storybordで該当テキストフィールドを選択し、identity Inspectorでclassを DoneTextFierdに切り替える
class DoneTextFierd: UITextField{

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit(){
        let tools = UIToolbar()
        tools.frame = CGRect(x: 0, y: 0, width: frame.width, height: 40)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let closeButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.closeButtonTapped))
        tools.items = [spacer, closeButton]
        self.inputAccessoryView = tools
    }

    @objc func closeButtonTapped(){
        self.endEditing(true)
        self.resignFirstResponder()
    }
}
