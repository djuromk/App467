//
//  HomeViewModel.swift
//  App467
//
//  Created by IGOR on 17/04/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {

    @Published var currencies: [String] = ["EUR/USD", "USD/JPY", "EUR/JPY", "AUD/USD", "USD/CAD", "USD/CHF", "NZD/USD"]
    @Published var currentCurrency = ""
    @AppStorage("pair") var pair = ""
    
    @AppStorage("balance") var balance: String = ""
    @AppStorage("change") var change: String = ""
    
    @Published var addBalance = ""
    @Published var addChange = ""
    
    @Published var directions: [String] = ["Up", "Down"]
    @Published var currentDirection = ""
    @AppStorage("dir") var dir = ""

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isEditBalance: Bool = false
    
    @Published var isGraphic: Bool = false
    @Published var isCurrencies: Bool = false
    
    @Published var isTR: Bool = false
    @Published var isTE: Bool = false
    @Published var isNP: Bool = false
    
    @AppStorage("TR") var TR: String = ""
    @AppStorage("TE") var TE: String = ""
    @AppStorage("NP") var NP: String = ""
    
    @Published var addTR = ""
    @Published var addTE = ""
    @Published var addNP = ""
    
    @Published var statuss: [String] = ["Available", "In Service", "Servicing", "Not Available", "Waiting"]
    @Published var currentStatus = ""
    
    @AppStorage("names") var names: [String] = []

    @Published var orderID = ""
    @Published var orderDriver = ""
    @Published var orderVehicle = ""
    @Published var pickLocation = ""
    @Published var dropLocation = ""
    @Published var timePickUp = ""
    @Published var orderStatus = ""
    @Published var orderFare = ""

    @Published var orders: [OrdersModel] = []
    @Published var selectedOrder: OrdersModel?

    func addOrder() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "OrdersModel", into: context) as! OrdersModel

        loan.orderID = orderID
        loan.orderDriver = orderDriver
        loan.orderVehicle = orderVehicle
        loan.pickLocation = pickLocation
        loan.dropLocation = dropLocation
        loan.timePickUp = timePickUp
        loan.orderStatus = orderStatus
        loan.orderFare = orderFare

        CoreDataStack.shared.saveContext()
    }
    
    func fetchOrders() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<OrdersModel>(entityName: "OrdersModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.orders = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.orders = []
        }
    }
}
