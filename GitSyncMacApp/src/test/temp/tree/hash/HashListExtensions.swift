import Foundation
@testable import Utils

extension HashList{
    subscript(at:Int) -> String? {//returns key for array idx
        get {return arr[at]}
    }
    subscript(key:String) -> Int? {//returns the internal array idx for key
        get {return dict[key]}
    }
    /**
     * Adds key
     */
    mutating func add(_ key:String){
        if(!dict.hasKey(key)){
            arr.append(key)//store content in arr
            let idx:Int = arr.count-1
            dict[key] = idx//store idx in key
        }else{fatalError("key already exist")}
    }
    /**
     * Removes key
     */
    mutating func remove(_ key:String){
        if let idx:Int = dict[key]{//make sure the key exists
            _ = arr.removeAt(idx)//remove item from arr
            dict.removeValue(forKey: key)//remove key and val from dict
        }else{fatalError("key does not exist")}
    }
    /**
     * Adds key at index
     */
    mutating func add(_ key:String,_ at:Int){
        if(!dict.hasKey(key)){
            _ = arr.insertAt(key, at)//store content in arr
            dict[key] = at//store idx in key
        }else{fatalError("key already exist")}
    }
    /**
     * Removes key at index
     */
    mutating func removeAt(_ key:String, _ at:Int){
        if(!dict.hasKey(key)){//make sure the key exists
            _ = arr.remove(at:at)
            dict.removeValue(forKey:key)//remove key and val from dict
        }else{fatalError("key does not exist")}
    }
}