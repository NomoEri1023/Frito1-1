//
//  henkouViewController.swift
//  Frito1
//
//  Created by 野本エリカ on 2018/05/16.
//  Copyright © 2018年 Life is Tech!. All rights reserved.
//

import UIKit
import RealmSwift

class henkouViewController: UIViewController, UITextFieldDelegate {
    
    var Fdata: Shouhin! // 画面遷移後は ["hello": "こんにちは", "goodbye": "さようなら"]
    
    
    
    @IBOutlet var sholv: UILabel!
    
    @IBOutlet var kazulv: UILabel!
    
    @IBOutlet var shotxf: UITextField!
    
    @IBOutlet var kazuLv: UILabel!
    
    @IBAction func step(_ sender: UIStepper) {
        self.kazuLv.text = String(sender.value)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    
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
        
        let alertController = UIAlertController(title: "保存完了", message: "食材の変更を登録しました！", preferredStyle: .alert)
        
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
        shotxf.text = ""
        kazuLv.text = "0.0"
    }
    
    
    
    
}
