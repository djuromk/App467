//
//  GarageViewModel.swift
//  App467
//
//  Created by IGOR on 17/04/2024.
//

import SwiftUI
import CoreData

final class GarageViewModel: ObservableObject {
    
    @Published var addingType: [String] = ["Car", "Driver"]
    @Published var currentAdding = ""

    @AppStorage("balance") var balance: String = ""
    @AppStorage("change") var change: String = ""
    
    @Published var addBalance = ""
    @Published var addChange = ""

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isEditBalance: Bool = false
    
    @Published var isAddCar: Bool = false
    @Published var isAddDriver: Bool = false
    
    @Published var isTC: Bool = false
    @Published var isTD: Bool = false
    
    @AppStorage("TC") var TC: String = ""
    @AppStorage("TD") var TD: String = ""
    
    @Published var addTC = ""
    @Published var addTD = ""
    
    @Published var statuss: [String] = ["Available", "In Service", "Servicing", "Not Available", "Waitibg"]
    @Published var currentStatus = ""
    
    @AppStorage("names") var names: [String] = []
    @Published var driverName = ""
    @Published var selectedDriver = ""

    @Published var carDriver = ""
    @Published var carMarkModel = ""
    @Published var carPlate = ""
    @Published var carStatus = ""
    @Published var carMileage = ""
    @Published var carLastService = ""
    @Published var carNextService = ""

    @Published var cars: [CarsModel] = []
    @Published var selectedCar: CarsModel?

    func addCar() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CarsModel", into: context) as! CarsModel

        loan.carDriver = carDriver
        loan.carMarkModel = carMarkModel
        loan.carPlate = carPlate
        loan.carStatus = carStatus
        loan.carMileage = carMileage
        loan.carLastService = carLastService
        loan.carNextService = carNextService

        CoreDataStack.shared.saveContext()
    }
    
    func fetchCars() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CarsModel>(entityName: "CarsModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.cars = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.cars = []
        }
    }
}
