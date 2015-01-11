//  ThirdView.swift
//  TestAppInputForm02

import UIKit

class ThirdViewController: UIViewController {
    

    @IBOutlet weak var ThisCloseButton: UIButton!
    @IBOutlet weak var AllCloseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ThisCloseButton.addTarget(self, action: "backToMain:", forControlEvents: .TouchUpInside)
        AllCloseButton.addTarget(self, action: "allClose:", forControlEvents: .TouchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func backToMain(sender: AnyObject?) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    func allClose(sender: AnyObject?){
        UIApplication.sharedApplication().keyWindow.rootViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
