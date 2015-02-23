//
//  SETextViewCell.swift
//  TextLabelSample
//
//  Created by Hiroki Yoshifuji on 2015/02/21.
//  Copyright (c) 2015年 Hiroki Yoshifuji. All rights reserved.
//

import UIKit

class SETextViewCell : UITableViewCell, SETextViewDelegate {
    
    @IBOutlet weak var textView: SETextView!
    
    override func awakeFromNib() {
        self.initialize()
    }
    private func initialize() {
        self.textView.delegate = self
        self.textView.font = UIFont.systemFontOfSize(14.0)
    }
    
    class func heightWithText(text: String) -> CGFloat{
        
        let attr = self.createAttributedString(text)
        let size = SETextView.frameRectWithAttributtedString(attr, constraintSize: CGSize(width: UIScreen.mainScreen().bounds.width - 32, height: 10000))
        return size.height + 32
    }
    
    class func createAttributedString(text:String) -> NSAttributedString {
        var error: NSError?
        var dataDetector = NSDataDetector(types: NSTextCheckingType.Link.rawValue, error: &error)!
        
        var attr = NSMutableAttributedString(string: text)
        var results:Array = dataDetector.matchesInString(text, options: NSMatchingOptions.ReportProgress, range: NSMakeRange(0, attr.length))
        
        for result in results {
            var result2 = result as NSTextCheckingResult
            attr.addAttribute(NSLinkAttributeName, value: result2.URL!, range: result2.range)
            
            attr.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: result2.range)
        }
        
        return attr
    }
    
    func setText(text: String) {
        textView.attributedText = SETextViewCell.createAttributedString(text)
    }
    
   
    func textView(textView: SETextView!, clickedOnLink link: SELinkText!, atIndex charIndex: UInt) -> Bool {
        var url = link.object as NSURL
        println(url)

        return true;
    }
}
