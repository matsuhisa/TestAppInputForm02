//  SecondView.swift
//  TestAppInputForm02

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var ToThirdViewBbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Dark))
        visualEffectView.frame = self.view.bounds
        self.view.backgroundColor = UIColor.clearColor()
        self.view.addSubview(visualEffectView)
        self.view.sendSubviewToBack(visualEffectView)

        BackButton.addTarget(self, action: "backToMain:", forControlEvents: .TouchUpInside)
        ToThirdViewBbutton.addTarget(self, action: "toThird:", forControlEvents: .TouchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func backToMain(sender: AnyObject?) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }

    func toThird(sender: AnyObject?) {
        var thirdView:AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("third")
        self.presentViewController(thirdView as UIViewController, animated: true, completion:nil)
    }
}
