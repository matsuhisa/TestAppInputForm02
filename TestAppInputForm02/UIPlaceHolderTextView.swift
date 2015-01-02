//  UIPlaceHolderTextView.swift
//  TestAppInputForm02

// http://swift-nyumon.info/how_to_override_uiview_in_swift
// http://himaratsu.hatenablog.com/entry/objc/placeholderview
// http://qiita.com/tkuma/items/7e63c7fc9daf2a43c6cd
// http://stackoverflow.com/questions/1328638/placeholder-in-uitextview
//http://blog.f60k.com/objective-c%E3%81%A8swift%E3%81%AE%E7%B5%84%E3%81%BF%E5%90%88%E3%82%8F%E3%81%9B%E6%96%B9%E3%81%AE%E3%81%BE%E3%81%A8%E3%82%81part2/
// http://qiita.com/HirokiTanaka/items/e697670cb4c7c30f5764


import UIKit

public class UIPlaceHolderTextView: UITextView {


    lazy var placeHolderLabel:UILabel = UILabel()
    var placeHolderColor:UIColor  = UIColor.lightGrayColor()
    var placeHolder:NSString      = "PlaceHolderです"
    //var defaultCenter:NSNotificationCenter = NSNotificationCenter()

    
    required public init(coder aDecoder: NSCoder) {
        println("required init ------------")
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }


    override init(frame: CGRect){
        println("override init frame ------------")
        super.init(frame: frame)
    }

    override init() {
        println("override init ------------")
        super.init()
    }


    deinit {
        println("deinit ------------")
        //self.defaultCenter.removeObserver(self)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override public func awakeFromNib() {
        println("awakeFromNib ------------")
        super.awakeFromNib()


        
        //self.defaultCenter.addObserver(self, selector: "textChanged", name: "UITextViewTextDidChangeNotification", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textChanged:", name: UITextViewTextDidChangeNotification, object: nil)
    }

    override public func drawRect(rect: CGRect) {
        println("drawRect ------------")
        
        if(self.placeHolder.length > 0) {
            //self.placeHolderLabel = UILabel(frame: CGRectMake(8,8,self.bounds.size.width - 16,0))
            self.placeHolderLabel.frame = CGRectMake(8,8,self.bounds.size.width - 16,0)
                
            self.placeHolderLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
            self.placeHolderLabel.numberOfLines = 0
            self.placeHolderLabel.font = self.font
            self.placeHolderLabel.backgroundColor = UIColor.clearColor()
            self.placeHolderLabel.textColor = self.placeHolderColor
            self.placeHolderLabel.alpha = 1
            self.placeHolderLabel.tag = 999
            
            self.placeHolderLabel.text = self.placeHolder
            self.placeHolderLabel.sizeToFit()
            
            self.addSubview(placeHolderLabel)
        }
        

        self.sendSubviewToBack(placeHolderLabel)
        
        super.drawRect(rect)
    }
    

    
    public func textChanged(notification:NSNotification?) -> (Void) {
        println("textChanged ------------")
        if(self.placeHolder.length == 0){
            return
        }
        
        if(self.text.utf16Count == 0) {
            var view = self.viewWithTag(999)
            view?.alpha = 1
        }else{
            var view = self.viewWithTag(999)
            view?.alpha = 0
        }
        println("textChanged ------------")
    }
    
    func setText(text:NSString) {
        println("setText ------------")
        super.text = text
        self.textChanged(nil)
    }

}
