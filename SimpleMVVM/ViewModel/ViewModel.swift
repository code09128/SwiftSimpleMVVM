//
//  ViewModel.swift
//  SimpleMVVM
//
//  Created by Dustin on 2022/5/11.
//

import UIKit

class ViewModel: NSObject {
    private var employeeRepository: EmployeesServiceProtocol
    var reloadTableView: (() -> Void)?
    var employees = Employees()

    /**初始化資料*/
    init(employeeRepository: EmployeesServiceProtocol = Repository()) {
        self.employeeRepository = employeeRepository
    }
    
    //cell顯示資料
    var cellViewModels = [Employee]() {
        didSet {
            reloadTableView?()
        }
    }
    
    //取得Employee資料
    func getEmployees() {
        employeeRepository.getEmployees{ success, model, error in
            if (success){
                let employees = model
                self.fetchData(employees: employees!)
            }
            else{
                print(error!)
            }
        }
    }
    
    //新增資料
    func fetchData(employees: Employees) {
        self.employees = employees // Cache
        var vms = [Employee]()
        
        for employee in employees {
            vms.append(createCellModel(employee: employee))
        }
        
        cellViewModels = vms
    }
    
    //cell塞入的欄位
    func createCellModel(employee: Employee) -> Employee {
        let id = employee.id
        let name = employee.employeeName
        let salary = "$ " + employee.employeeSalary
        let age = employee.employeeAge
        
        return Employee(id: id, employeeName: name, employeeSalary: salary, employeeAge: age)
    }
    
    //設定cell數量
    func getCellViewModel(indexPath: IndexPath) -> Employee {
        return cellViewModels[indexPath.row]
    }
}
