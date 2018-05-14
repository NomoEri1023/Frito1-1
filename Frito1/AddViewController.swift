//
//  AddViewController.swift
//  Frito1
//
//  Created by 野本エリカ on 2018/05/05.
//  Copyright © 2018年 Life is Tech!. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet var shouhin: UILabel!
    @IBOutlet var kosu: UILabel!
    @IBOutlet var Text: UITextField!
    @IBOutlet var kazu: UILabel!
    @IBOutlet var mystepper: UIStepper!
    @IBAction func mystepperAction(_ sender: UIStepper) {
        
        kazu.isHidden = false
        kazu.text = String(mystepper.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Text.delegate = self
    }    // Do any additional setup after loading the view.
    
    
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


