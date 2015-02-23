//
//  MasterViewController.swift
//  TextLabelSample
//
//  Created by Hiroki Yoshifuji on 2015/02/21.
//  Copyright (c) 2015年 Hiroki Yoshifuji. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var objects = [
        TextLabelKind.SECoreTextView,
        TextLabelKind.TTTAttributedLabel,
    ]


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func nameWithTextLabelKind(kind : TextLabelKind) -> String {
        switch (kind) {
        case .SECoreTextView:     return "SECoreTextView"
        case .TTTAttributedLabel: return "TTTAttributedLabel"
        }
    }
    
    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let textLabelKind = objects[indexPath.row]
                (segue.destinationViewController as DetailViewController).title = self.nameWithTextLabelKind(textLabelKind)
                (segue.destinationViewController as DetailViewController).textLabelKind = textLabelKind
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let textLabelKind = objects[indexPath.row]
        cell.textLabel!.text = self.nameWithTextLabelKind(textLabelKind)
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

}

