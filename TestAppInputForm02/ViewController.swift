//  ViewController.swift
//  TestAppInputForm02

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TestWebView: UIWebView!
    @IBOutlet weak var ImutView: UIPlaceHolderTextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        ImutView.placeHolder = "本文です。"
        ImutView.placeHolderColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.2)
        
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
}

