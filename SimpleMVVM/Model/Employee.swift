//
//  Employee.swift
//  SimpleMVVM
//
//  Created by Dustin on 2022/5/12.
//

import Foundation

typealias Employees = [Employee]

struct Employee: Codable {
    let id: String
    let employeeName: String
    let employeeSalary: String
    let employeeAge: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
    }
}

