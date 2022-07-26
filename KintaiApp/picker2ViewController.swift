//
//  picker2ViewController.swift
//  KintaiApp
//
//  Created by 高木克 on 2022/07/23.
//

import UIKit

class picker2ViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate {

    //textFieldとのアウトレット接続
//    @IBOutlet weak var kanaTextField: UITextField!
//    @IBOutlet weak var dateTextField: UITextField!
//    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    //pickerViewのプロパティを作る
    var kanaPickerView : UIPickerView = UIPickerView()
    var numberPickerView  : UIPickerView = UIPickerView()
    //datePickerのプロパティを作る
    var datePickerView  :UIDatePicker = UIDatePicker()
    
    //pickerViewに表示する配列を作成
    let list1:[String] = ["10","に","さん","よん","ご",]
    let list2:[String] = ["45","2","3","4","5","6","7"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "sampleTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        makePickerKeybord()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list1.count
    }
    
    func tableView(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        return cell
    }
    
    //キーボードの設定
    func makePickerKeybord(){
        //かな数字のPickerviewをキーボードにする設定
        kanaPickerView.tag = 1
        kanaPickerView.delegate = self
        kanaTextField.inputView = kanaPickerView
        kanaTextField.delegate = self
        
        //numberのPickerviewをキーボードにする設定
        numberPickerView.tag = 2
        numberPickerView.delegate = self
        numberTextField.inputView = numberPickerView
        numberTextField.delegate = self
        
        // 日付ピッカーをキーボードにする設定
        datePickerView.datePickerMode = UIDatePicker.Mode.dateAndTime
        datePickerView.timeZone = TimeZone(identifier: "Asia/Tokyo")
        datePickerView.locale = Locale(identifier: "ja_JP")
        datePickerView.addTarget(self, action: Selector(("dateChange")), for: .valueChanged)
        dateTextField.inputView = datePickerView
        dateTextField.delegate = self
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return list1.count
        case 2:
            return list2.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
            case 1:
                return list1[row]
            case 2:
                return list2[row]
        default:
            return "error"
        }
    }
    
     //pickerが選択された際に呼ばれるデリゲートメソッド.
     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         switch pickerView.tag {
             case 1:
                 return kanaTextField.text = list1[row]
             case 2:
                 return numberTextField.text = list2[row]
         default:
             return
         }
     }
     
     //datePickerが変化すると呼ばれる
    @objc func dateChange(){
         let formatter = DateFormatter()
         formatter.dateFormat = "HH:mm"
         dateTextField.text = "\(formatter.string(from: datePickerView.date))"
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
