//
//  DetailViewController.swift
//  TextLabelSample
//
//  Created by Hiroki Yoshifuji on 2015/02/21.
//  Copyright (c) 2015年 Hiroki Yoshifuji. All rights reserved.
//

import UIKit

enum TextLabelKind:Int {
    case SECoreTextView
    case TTTAttributedLabel
}

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var textLabelKind = TextLabelKind.SECoreTextView
    
    var textList = [
        "［http://www.itmedia.co.jp ］基本プランは月額1万4800円、「Pepper」開発者向けに販売開始 http://bit.ly/1LjMY79",
        "【タイムセール】毎日深夜0時更新！掘り出し物をチェック\n (PC)⇒ http://amzn.to/1AXek02\n (モバイル)⇒ http://amzn.to/1CQB3K7\n ※最安値を狙う方におススメ ",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table View

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textList.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch (textLabelKind) {
        case .SECoreTextView:
            let cell = tableView.dequeueReusableCellWithIdentifier("SETextViewCell", forIndexPath: indexPath) as SETextViewCell
            
            let text = textList[indexPath.row]
            cell.setText(text)
            return cell
        case .TTTAttributedLabel:
            let cell = tableView.dequeueReusableCellWithIdentifier("TTTAttributedLabel", forIndexPath: indexPath) as TTTAttributedLabelCell
            
            let text = textList[indexPath.row]
            cell.setText(text)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let text = textList[indexPath.row]
        switch (textLabelKind) {
        case .SECoreTextView:
            
            return SETextViewCell.heightWithText(text)
            
        case .TTTAttributedLabel:
            
            return TTTAttributedLabelCell.heightWithText(text)
            
        }
    }
}

