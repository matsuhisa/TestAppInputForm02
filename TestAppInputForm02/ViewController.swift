//  ViewController.swift
//  TestAppInputForm02

import UIKit

class ViewController: UIViewController, ModalViewDelegate, UITextFieldDelegate, UITextViewDelegate{
    
    @IBOutlet weak var TestWebView: UIWebView!
    @IBOutlet weak var ImutView: UIPlaceHolderTextView!
    @IBOutlet weak var SaveButton: UIButton!
    @IBOutlet weak var InputTitle: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // TextViewの設定
        ImutView.placeHolder = "本文です。"
        ImutView.placeHolderColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.5)
        
        ImutView.delegate = self
        
        InputTitle.delegate = self
        
        // ボタンの設定
        //SaveButton.addTarget(self, action: "click:", forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 2枚目のモーダルウィンドウ
    func click(sender: AnyObject?) {
        // http://ushisantoasobu.hateblo.jp/entry/2014/09/12/023926
        var secondView:SecondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("second") as SecondViewController

        secondView.modalPresentationStyle = UIModalPresentationStyle.OverFullScreen

        self.presentViewController(secondView as UIViewController, animated: true, completion:nil)
    }
    
    // 3枚目のモーダルウィンドウ
    func clickToThird(sender: AnyObject?) {
        var thirdView:AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("third")
        self.presentViewController(thirdView as UIViewController, animated: true, completion:nil)
    }

    // textViewが選択された時
    func textViewDidBeginEditing(textView: UITextView) {
        println("textViewDidBeginEditing -----------")
        self.clickToThird(self)
    }
    
    // textViewの選択が外れた時
    func textViewDidEndEditing(textView: UITextView) {
        println("textViewDidEndEditing -----------")
    }
    
    // ？
    func textViewShouldBeginEditing() ->Bool{
        println("textViewShouldBeginEditing -----------")
        return false
    }
    
    /*
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        println( textField.text )
        return true
    }
    
    func textFieldShouldBeginEditing(textField: UITextView) -> Bool {
        println("textFieldShouldBeginEditing ------")
        return false
    }
    
    func textFieldDidBeginEditing(textField: UITextView) {
        println("textFieldDidBeginEditing ------")
    }
    */
    
    // 保存処理
    func saveText(textdata:String){
        ImutView.text = textdata
    }
}

