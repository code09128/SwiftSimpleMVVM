//
//  TableViewCell.swift
//  SimpleMVVM
//
//  Created by Dustin on 2022/5/11.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var cellViewModel: Employee? {
        didSet {
            idLabel.text = cellViewModel?.id
            nameLabel.text = cellViewModel?.employeeName
            salaryLabel.text = cellViewModel?.employeeSalary
            ageLabel.text = cellViewModel?.employeeAge
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
