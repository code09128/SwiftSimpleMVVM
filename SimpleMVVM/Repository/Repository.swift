//
//  Repository.swift
//  SimpleMVVM
//
//  Created by Dustin on 2022/5/12.
//

import Foundation

protocol EmployeesServiceProtocol {
    func getEmployees(completion: @escaping ((success: Bool, results: Employees?, error: String?)) -> Void)
}

//MARK: - API資料連線處理
class Repository: EmployeesServiceProtocol {
    func getEmployees(completion: @escaping ((success: Bool, results: Employees?, error: String?)) -> Void) {
        
        HttpRequestHelper().GET(url: "https://raw.githubusercontent.com/johncodeos-blog/MVVMiOSExample/main/demo.json", params: ["": ""], httpHeader: .application_json){ success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(Employees.self, from: data!)
                    completion((true, model, nil))
                } catch {
                    completion((false, nil, "Error: Trying to parse Employees to model"))
                }
            } else {
                completion((false, nil, "Error: Employees GET Request failed"))
            }
        }
    }
    
//    func getEmployees(completion: @escaping (Bool, Employees?, String?) -> ()) {
//        HttpRequestHelper().GET(url: "https://raw.githubusercontent.com/johncodeos-blog/MVVMiOSExample/main/demo.json", params: ["": ""], httpHeader: .application_json) { success, data in
//            if success {
//                do {
//                    let model = try JSONDecoder().decode(Employees.self, from: data!)
//                    completion(true, model, nil)
//                } catch {
//                    completion(false, nil, "Error: Trying to parse Employees to model")
//                }
//            } else {
//                completion(false, nil, "Error: Employees GET Request failed")
//            }
//        }
//    }
}

