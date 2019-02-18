//
//  AddViewController.swift
//  ToDoApp
//
//  Created by 鍋島 由輝 on 2019/02/18.
//  Copyright © 2019 ValJapan. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    //変数を宣言する
    var todo = [String]()
    
    //テキストフィールドの設定
    @IBOutlet var TodoTextField:UITextField!
    
    //追加ボタンの設定
    @IBAction func TodoAddButton(){
        
        //追加画面で入力した内容を取得する
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            todo = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
        //変数に入力内容を入れる
        todo.append(TodoTextField.text!)
        //追加ボタンを押したらフィールドを空白にする
        TodoTextField.text = ""
        //変数の中身をUserDefaltsに追加
        UserDefaults.standard.set(todo, forKey: "TodoList")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
