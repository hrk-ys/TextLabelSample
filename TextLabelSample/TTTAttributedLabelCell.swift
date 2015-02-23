//
//  TTTAttributedLabelCell.swift
//  TextLabelSample
//
//  Created by Hiroki Yoshifuji on 2015/02/21.
//  Copyright (c) 2015年 Hiroki Yoshifuji. All rights reserved.
//

import UIKit

class TTTAttributedLabelCell : UITableViewCell {
    
    @IBOutlet weak var attrLabel: TTTAttributedLabel!
    
    override func awakeFromNib() {
        self.initialize()
    }
    private func initialize() {
        attrLabel.enabledTextCheckingTypes = NSTextCheckingType.Link.rawValue
        
    }
    
    class func heightWithText(text: String) -> CGFloat {
        
//        let attr = NSAttributedString(string: text)
//        let size = TTTAttributedLabel.sizeThatFitsAttributedString(attr, withConstraints: CGSize(width: UIScreen.mainScreen().bounds.width - 32, height: 10000), limitedToNumberOfLines: 0)
//        let string = NSString(string: text)
//        let options:NSStringDrawingOptions = StringDrawingOptions.combine(NSStringDrawingOptions.UsesLineFragmentOrigin, with: NSStringDrawingOptions.UsesFontLeading)
//        let attributes: Dictionary = [NSFontAttributeName: UIFont.systemFontOfSize(14.0)]
        
//        text.boundingRectWithSize(CGSize(width: UIScreen.mainScreen().bounds.width - 32, height: 10000),
//            options: NSStringDrawingOptions.UsesLineFragmentOrigin,
//            attributes: [], context: self)
        
        let size = CGSize(width: CGRectGetWidth(UIScreen.mainScreen().bounds) - 32, height: 10000)
        let str = NSString(string: text)
        let contentSize = str.sizeWithAttributes(nil)
        
        return contentSize.height + 32
    }
    
    func setText(text: String) {
        attrLabel.text = text
    }
    
}
