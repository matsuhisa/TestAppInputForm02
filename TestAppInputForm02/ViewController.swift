//  ViewController.swift
//  TestAppInputForm02

import UIKit

class ViewController: UIViewController, ModalViewDelegate{
    
    @IBOutlet weak var TestWebView: UIWebView!
    @IBOutlet weak var ImutView: UIPlaceHolderTextView!
    @IBOutlet weak var SaveButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // TextViewの設定
        ImutView.placeHolder = "本文です。"
        ImutView.placeHolderColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.5)
        
        // ボタンの設定
        SaveButton.addTarget(self, action: "click:", forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func click(sender: AnyObject?) {
        // http://ushisantoasobu.hateblo.jp/entry/2014/09/12/023926
        var secondView:SecondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("second") as SecondViewController

        secondView.modalPresentationStyle = UIModalPresentationStyle.OverFullScreen

        self.presentViewController(secondView as UIViewController, animated: true, completion:nil)
    }
    
    func saveText(textdata:String){
        ImutView.text = textdata
    }
}

