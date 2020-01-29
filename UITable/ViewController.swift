//
//  ViewController.swift
//  UITable
//
//  Created by rabbit on 2020/01/29.
//  Copyright © 2020 rabbit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }

}

// MARK: - Table View
extension ViewController: UITableViewDataSource, UITableViewDelegate {

    // セクション毎の行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 2
        }
        return 3
    }


    // セル（行）の登録
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = "Cell-" + String(indexPath.row)
        cell.detailTextLabel?.text = "Subtitle of section:\(indexPath.section)-cell:\(indexPath.row)"
        cell.imageView?.image = UIImage(systemName: "square")
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }

    // セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    // セクションのタイトル
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section-\(section)" // セクションのタイトルは英字だと大文字に変換されるので注意。
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if (cell?.imageView?.image == UIImage(systemName: "square")) {
            cell?.imageView?.image = UIImage(systemName: "checkmark.square.fill")
        }
        else {
            cell?.imageView?.image = UIImage(systemName: "square")
        }
    }
}


