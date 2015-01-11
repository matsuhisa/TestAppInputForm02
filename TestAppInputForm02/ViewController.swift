//  ViewController.swift
//  TestAppInputForm02

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TestWebView: UIWebView!
    @IBOutlet weak var ImutView: UIPlaceHolderTextView!
    @IBOutlet weak var SaveButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImutView.placeHolder = "本文です。"
        ImutView.placeHolderColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.5)
        
        SaveButton.addTarget(self, action: "click:", forControlEvents: .TouchUpInside)
        
        // 文字列からWebViewを表示する
        /*
        var html:String = "<html><head></head><body><a href=\"http://www.yahoo.co.jp/\">Yahoo!</a></body></html>"
        var htmldata = html.dataUsingEncoding(NSUTF8StringEncoding)
        TestWebView.loadData(htmldata, MIMEType: "text/html", textEncodingName: "utf-8", baseURL: nil)
        */
        
        // URLからWebViewを表示する
        /*
        var url: NSURL = NSURL.URLWithString("http://www.yahoo.co.jp/")
        var urlRequest: NSURLRequest = NSURLRequest(URL: url)
        TestWebView.loadRequest(urlRequest)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func click(sender: AnyObject?) {
        //var secondView:SecondViewController = SecondViewController()
        //self.presentViewController(secondView, animated: true, completion:nil)
        
        //var secondView:AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("second")
        // http://ushisantoasobu.hateblo.jp/entry/2014/09/12/023926
        var secondView:SecondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("second") as SecondViewController

        secondView.modalPresentationStyle = UIModalPresentationStyle.OverFullScreen

        
        self.presentViewController(secondView as UIViewController, animated: true, completion:nil)
    }
}

