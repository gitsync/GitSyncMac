import Foundation
@testable import Utils

//Continue here: 
    //You can't remove while you walk forward. maybe, make a descendantCount for tree instead would be easier
    //or you could try to find idx after idx || end, and then use the idx to calc how many items needs to be deleted

class HashListModifier {
    /**
     *
     */
    func removeDescendants(_ list:HashList,_ idx:Int){
        var end:Int
        
        let idx3dStr = list[idx]
        var idx3d:[Int] = idx3dStr!.array({$0.int})
        idx3d.end = (idx3d.end ?? 0) + 1//incremts the end with 1
        let idxStr:String = idx3d.string
        let subseedingIdx:Int = list[idxStr]!
        if(list[subseedingIdx] != nil){//has subseeding item
            end = subseedingIdx
        }else{//no subseeding item use .count
            end = list.arr.count//<-could be -1
        }
        
        //list.arr.remove(idx,end)
        
    }
    /**
     *
     */
    func addDecendants(_ list:HashList,_ at:Int){
        
    }
}
