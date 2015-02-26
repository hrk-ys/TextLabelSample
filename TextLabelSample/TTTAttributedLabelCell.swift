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
        let string = NSString(string: text)
        let size = CGSize(width: CGRectGetWidth(UIScreen.mainScreen().bounds) - 32, height: CGFloat.max)
        let options = NSStringDrawingOptions.UsesLineFragmentOrigin
        
        let font = UIFont.systemFontOfSize(14.0)
        var attributes = [NSFontAttributeName:font]
        
        let frame = text.boundingRectWithSize(size,
            options: options,
            attributes: attributes,
            context: nil)
        println("frame \(frame)")
        let height = ceil(frame.size.height) + 32 + 1
        
        let attr = NSMutableAttributedString(string: text)
        attr.addFontAttribute(font, range: NSMakeRange(0, attr.length))
        let frame2 = attr.boundingRectWithSize(size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil)
        println("frame \(frame2)")
        
        println("height \(height)")
        
        return height
    }
    
    func setText(text: String) {
        attrLabel.text = text
    }
    
}
