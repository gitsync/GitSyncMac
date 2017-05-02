import Foundation
@testable import Utils
@testable import Element

class TreeList3AdvanceModifier {
    /**
     * NOTE: To explode the entire treeList pass an empty array as PARAM: index
     */
    static func explode(_ treeList:TreeListable3,_ idx3d:[Int]) {
        if let isOpen = treeList.treeDP.tree.props?["isOpen"]  {/*if has isOpen param and its set to false*/
            if isOpen == "true" {/*already open*/
                TreeList3Modifier.close(treeList,idx3d)
            }
            /*1.traverse all items and set to open*/
            TreeList3Modifier.recursiveApply(&treeList.treeDP.tree[idx3d]!,TreeList3Modifier.setValue,("isOpen","true"))
            /*2.add all descedants to 2d list*/
            let idx2d:Int = treeList.treeDP[idx3d]!
            let count:Int = HashList2Modifier.addDescendants(&treeList.treeDP.hashList, idx2d, idx3d, treeList.treeDP.tree)/*adds items to HashList (via HashListModifier.addDescendants)*/
            /*3.use the count to update DP and UI*/
            treeList.dp.onEvent(DataProviderEvent(DataProviderEvent.add, idx2d, idx2d+count, treeList.dp))
        }
    }
    /**
     * NOTE: To collapse the entire treeList pass an empty array as PARAM: index
     * NOTE: This method collapses all nodes from the PARAM: index
     */
    static func collapse(_ treeList:TreeListable3,_ idx3d:[Int]) {
        if let isOpen = treeList.treeDP.tree.props?["isOpen"]  {/*if has isOpen param and its set to false*/
            /*1.traverse all items and set to open*/
            TreeList3Modifier.recursiveApply(&treeList.treeDP.tree[idx3d]!,TreeList3Modifier.setValue,("isOpen","false"))
            if isOpen == "true" {/*item at idx3d was open*/
                /*2.remove all descedants to 2d list*/
                let idx2d:Int = treeList.treeDP[idx3d]!
                let count:Int = HashList2Modifier.removeDescendants(&treeList.treeDP.hashList, idx2d, idx3d, treeList.treeDP.tree)/*adds items to HashList (via HashListModifier.addDescendants)*/
                /*3.use the count to update DP and UI*/
                treeList.dp.onEvent(DataProviderEvent(DataProviderEvent.remove, idx2d, idx2d+count, treeList.dp))
            }
        }
    }
    /**
     * TODO: Should explode each node until it reaches its idx3d
     * NOTE: when to use this? When you programatically want to reveal an item deeply nested in the tree-structure
     * TODO: acompany this method with a scrollTo(idx3d) method
     */
    static func reveal(){
        
    }
}