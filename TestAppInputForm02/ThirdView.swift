//  ThirdView.swift
//  TestAppInputForm02

import UIKit

@objc protocol ModalViewDelegate {
    func saveText(textdata:String)
}

class ThirdViewController: UIViewController {
    
    var delegate:ModalViewDelegate! = nil
    
    @IBOutlet weak var ThisCloseButton: UIButton!
    @IBOutlet weak var AllCloseButton: UIButton!
    @IBOutlet weak var InputTextThird: UIPlaceHolderTextView!
    @IBOutlet weak var SaveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // TextViewの設定
        InputTextThird.placeHolder = "3枚目のViewです。ここに本文を書き、1枚目に送ります"
        
        // ボタンの設定
        ThisCloseButton.addTarget(self, action: "backToMain:", forControlEvents: .TouchUpInside)
        AllCloseButton.addTarget(self, action: "allClose:", forControlEvents: .TouchUpInside)
        SaveButton.addTarget(self, action: "saveSubmit:", forControlEvents: .TouchUpInside)
        
        // rootViewからdelegate を設定する
        var rootView  = UIApplication.sharedApplication().keyWindow.rootViewController as ViewController
        self.delegate = rootView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func backToMain(sender: AnyObject?) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    func allClose(sender: AnyObject?) {
        UIApplication.sharedApplication().keyWindow.rootViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func saveSubmit(sender: AnyObject?) {
        
        var inputText:String = InputTextThird.text
        self.delegate.saveText(inputText)

        // 閉じる
        self.allClose(sender)
    }
}
