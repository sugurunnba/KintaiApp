//
//  sampleTableViewCell.swift
//  KintaiApp
//
//  Created by 高木克 on 2022/07/26.
//

import UIKit

class sampleTableViewCell: UITableViewCell ,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    @IBOutlet weak var kanaTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!    //pickerViewに表示する配列を作成
    
    //pickerViewのプロパティを作る
    var kanaPickerView : UIPickerView = UIPickerView()
    var numberPickerView  : UIPickerView = UIPickerView()
    //datePickerのプロパティを作る
    var datePickerView  :UIDatePicker = UIDatePicker()
    
    let list1:[String] = ["10","に","さん","よん","ご",]
    let list2:[String] = ["45","2","3","4","5","6","7"]
    
    //キーボードの設定
    func makePickerKeybord(cellce: sampleTableViewCell){
        //かな数字のPickerviewをキーボードにする設定
        kanaPickerView.tag = 1
        kanaPickerView.delegate = self
        cellce.kanaTextField.inputView = kanaPickerView
        cellce.kanaTextField.delegate = self
        
        //numberのPickerviewをキーボードにする設定
        numberPickerView.tag = 2
        numberPickerView.delegate = self
        cellce.numberTextField.inputView = numberPickerView
        cellce.numberTextField.delegate = self
        
        // 日付ピッカーをキーボードにする設定
        datePickerView.datePickerMode = UIDatePicker.Mode.dateAndTime
        datePickerView.timeZone = TimeZone(identifier: "Asia/Tokyo")
        datePickerView.locale = Locale(identifier: "ja_JP")
        datePickerView.addTarget(self, action: Selector(("dateChange")), for: .valueChanged)
        cellce.dateTextField.inputView = datePickerView
        cellce.dateTextField.delegate = self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //datePickerが変化すると呼ばれる
    @objc func dateChange(){
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        dateTextField.text = "\(formatter.string(from: datePickerView.date))"
    }
}
