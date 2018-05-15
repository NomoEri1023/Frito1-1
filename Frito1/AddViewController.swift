//
//  AddViewController.swift
//  Frito1
//
//  Created by 野本エリカ on 2018/05/05.
//  Copyright © 2018年 Life is Tech!. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    
    // 選択肢
    let dataList = ["肉", "魚介", "卵・乳製品", "野菜類", "果物", "加工食品", "穀類", "惣菜", "飲料", "菓子"]

    @IBOutlet var shouhin: UILabel!
    @IBOutlet var kosu: UILabel!
    @IBOutlet var Text: UITextField!
    @IBOutlet var kazu: UILabel!
    @IBOutlet var mystepper: UIStepper!
    @IBOutlet var kategori: UIPickerView!
    @IBAction func mystepperAction(_ sender: UIStepper) {
        
        kazu.isHidden = false
        kazu.text = String(mystepper.value)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Text.delegate = self
        // ピッカーの作成
        let picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        picker.center = self.view.center
        
        // プロトコルの設定
        picker.delegate = self
        picker.dataSource = self
        
        // はじめに表示する項目を指定
        picker.selectRow(1, inComponent: 0, animated: true)
        
        // 画面にピッカーを追加
        self.view.addSubview(picker)
        
    }// Do any additional setup after loading the view.
    
    // UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // 表示する列数
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // アイテム表示個数を返す
        return dataList.count
    }
    
    // UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 表示する文字列を返す
        return dataList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 選択時の処理
        print(dataList[row])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    @IBAction func tapView(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        let realm = try! Realm()
        // MyItemObjectモデルのデータをIdの降順で取得
        let lastItem = realm.objects(Shouhin.self).sorted(byKeyPath: "id", ascending: false)
        var addId: Int = 1
        if lastItem.count > 0 {
            addId = lastItem[0].id + 1
        }
        
        // 登録時に使用するIDを取得
        let addItemObj = Shouhin()
        addItemObj.id = addId
        addItemObj.name = Text.text!
        
        // 登録処理
        try! realm.write {
            realm.add(addItemObj, update: true)
        }
        
        // 前の画面に戻る処理を作成
        dismiss(animated: true, completion: nil)
        
        
        let alertController = UIAlertController(title: "保存完了", message: "食材の登録が完了しました！", preferredStyle: .alert)
        
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
    Text.text = ""
    kazu.text = "0.0"
    
        
       
    }
        
        
        
}
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


