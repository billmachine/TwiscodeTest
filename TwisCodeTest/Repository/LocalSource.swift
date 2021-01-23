//
//  LocalSource.swift
//  TwisCodeTest
//
//  Created by Ahmad Billi Afandi on 23/01/21.
//

import CoreData
import UIKit

class LocalSource {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TwisCodeTest")
        
        container.loadPersistentStores { _ , error in
            guard error == nil else {
                fatalError("Unresolved error \(error!)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = false
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.shouldDeleteInaccessibleFaults = true
        container.viewContext.undoManager = nil
        
        return container
    }()
    
    private func newTaskContext() -> NSManagedObjectContext {
        let taskContext = persistentContainer.newBackgroundContext()
        taskContext.undoManager = nil
        
        taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return taskContext
    }
    
    func getAll(completion: @escaping(_ members: [Product]) -> Void) {
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Cart")
            do {
                let results = try taskContext.fetch(fetchRequest)
                
                var members: [Product] = []
                for result in results {
                    let condition = Condition_of_item(name:result.value(forKeyPath: "condition") as? String ?? "")
                    let member = Product(
                        id: result.value(forKeyPath: "id") as? String ?? "",
                        price: result.value(forKeyPath: "price") as? String ?? "",
                        title: result.value(forKeyPath: "title") as? String ?? "",
                        weight: result.value(forKeyPath: "weight") as? String ?? "",
                        quantity: result.value(forKeyPath: "quantity") as? String ?? "",
                        urlImage: result.value(forKeyPath: "urlImage") as? String ?? "",
                        condition: condition
                    )
                    
                    members.append(member)
                }
                completion(members)
            } catch let error as NSError { print("Could not fetch. \(error), \(error.userInfo)") }
        }
    }
    
    func create(
        _ id: String,
        _ price: String,
        _ title: String,
        _ weight: String,
        _ quantity: String,
        _ urlImage: String,
        _ condition: Condition_of_item,
        completion: @escaping() -> Void
    ) {
        let taskContext = newTaskContext()
        taskContext.performAndWait {
            if let entity = NSEntityDescription.entity(forEntityName: "Cart", in: taskContext) {
                let member = NSManagedObject(entity: entity, insertInto: taskContext)

                member.setValue(id, forKeyPath: "id")
                member.setValue(urlImage, forKeyPath: "image")
                member.setValue(price, forKeyPath: "price")
                member.setValue(quantity, forKeyPath: "quantity")
                member.setValue(title, forKeyPath: "title")
                member.setValue(weight, forKeyPath: "weight")
                member.setValue(condition.name, forKeyPath: "condition")

                do {
                    try taskContext.save()
                    completion()
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }

            }
        }
    }

//    func addDummy(completion: @escaping() -> Void ) {
//        for game in gameDummies {
//            self.create(game.id,game.bg?.imgToData(),game.name,game.released,game.rating) {
//                    completion()
//                }
//        }
//    }

    func delete(_ id: Int, completion: @escaping() -> Void ) {
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "id == \(id)")
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            batchDeleteRequest.resultType = .resultTypeCount
            if let batchDeleteResult = try? taskContext.execute(batchDeleteRequest) as? NSBatchDeleteResult,
                batchDeleteResult.result != nil {
                completion()
            }
        }
    }

     func getById(_ id: Int, completion: @escaping(_ members: Product?) -> Void ) {
            let taskContext = newTaskContext()
            taskContext.perform {
                var member : Product?
                let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Cart")
                fetchRequest.fetchLimit = 1
                fetchRequest.predicate = NSPredicate(format: "id == \(id)")
                do {
                    if let result = try taskContext.fetch(fetchRequest).first {
                        let condition = Condition_of_item(name:result.value(forKeyPath: "condition") as? String ?? "")
                         member = Product(
                            id: result.value(forKeyPath: "id") as? String ?? "",
                            price: result.value(forKeyPath: "price") as? String ?? "",
                            title: result.value(forKeyPath: "title") as? String ?? "",
                            weight: result.value(forKeyPath: "weight") as? String ?? "",
                            quantity: result.value(forKeyPath: "quantity") as? String ?? "",
                            urlImage: result.value(forKeyPath: "urlImage") as? String ?? "",
                            condition: condition
                        )
                    }
                       completion(member)
                } catch let error as NSError {
                    print("Could not fetch. \(error), \(error.userInfo)")
                }
            }
        }

}
