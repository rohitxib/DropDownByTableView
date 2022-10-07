//
//  DropDownView.swift
//  DropDownByTableView
//
//  Created by Aplite_Mac on 07/10/22.
//

import UIKit
import Foundation

public class DropDownView: UIView {

    @IBOutlet weak var lblMain: UILabel!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet var viewContainer: UIView!
    public   var arrayData = Array(arrayLiteral: String())

 public   var dataCalbac :(String)->() = {_ in }
    override init(frame: CGRect) {
           super.init(frame: frame)
        self.initSubview()
       }

       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           self.initSubview()
       }
    private   func initSubview()  {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
      nib.instantiate(withOwner: self ,options: nil)
       // viewContainer.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        addSubview(viewContainer)
        let bundle = Bundle(for: DropTableCell.self)
        let nibCell = UINib(nibName: "DropTableCell", bundle: bundle)
        tblView.register(nibCell, forCellReuseIdentifier: "DropTableCell")
        tblView.dataSource = self
        tblView.delegate = self
       // self.addConstrants()
        viewContainer.fixInView(self)
       }
    
    
}
extension DropDownView : UITableViewDataSource,UITableViewDelegate{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tblView.dequeueReusableCell(withIdentifier: "DropTableCell") as! DropTableCell
        cell.lblTitle.text = arrayData[indexPath.row]
        return cell
        
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dataCalbac(arrayData[indexPath.row]) // callback
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
  
}

extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
