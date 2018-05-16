//
//  henkouViewController.swift
//  Frito1
//
//  Created by 野本エリカ on 2018/05/16.
//  Copyright © 2018年 Life is Tech!. All rights reserved.
//

import UIKit
import RealmSwift

class henkouViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var Fdata: Shouhin! // 画面遷移後は ["hello": "こんにちは", "goodbye": "さようなら"]
    
    var categoryArray: [String] = ["肉", "魚介", "卵・乳製品", "野菜類", "果物", "加工食品", "穀類", "惣菜", "飲料", "菓子"]
    
    var Selected = ""
    
    @IBOutlet var sholv: UILabel!
    
    @IBOutlet var kazulv: UILabel!
    
    @IBOutlet var shotxf: UITextField!
    
    @IBOutlet var kazuLv: UILabel!
    
    @IBAction func step(_ sender: UIStepper) {
        self.kazuLv.text = String(sender.value)
    }
    
    @IBOutlet var pick: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //delegate
        self.pick.delegate = self
        
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
        return categoryArray.count
    }
    
    // UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 表示する文字列を返す
        return categoryArray[row]
    }
    
    //func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 選択時の処理
        
        
        //Selected = categoryArray[row]
        
    //}
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //UIの表示
        shotxf.text = Fdata.name
        kazuLv.text = String(Fdata.number)
        
        
    }
    
    @IBAction func saveData() {
        let realm = try! Realm()
        
        try! realm.write {
            
            Fdata.name = self.shotxf.text!
            
            Fdata.number = Double(kazuLv.text!)!
            
            realm.add(Fdata, update: true)
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.kazuLv.text = categoryArray[row]
    }
    
    
}
