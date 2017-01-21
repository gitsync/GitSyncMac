import Cocoa

class BarGraph:Graph {
    var bars:[Bar] = []
    var twoFingersTouches:NSMutableDictionary?/*temp storage for the twoFingerTouches data*/
    override init(_ width:CGFloat, _ height:CGFloat, _ parent:IElement?, _ id: String? = nil) {
        super.init(width, height, parent, id)
        self.acceptsTouchEvents = true/*Enables gestures*/
    }
    
    override func createGraph(_ graphPts:[CGPoint]) {
        createBars(graphPts)
    }
    /**
     *
     */
    func createBars(_ graphPts:[CGPoint]){
        //graphArea?.addSubview()
        graphPts.forEach{
            let barHeight:CGFloat = newSize!.height - spacing!.height - $0.y
            let bar:Bar = graphArea!.addSubView(Bar(NaN,barHeight,graphArea))//width is set in the css
            bars.append(bar)
            bar.setPosition($0)//remember to offset with half the width in the css
        }
    }
    /**
     * Detects when touches are made
     */
    override func touchesBegan(with event:NSEvent) {
        //Swift.print("touchesBeganWithEvent: " + "\(touchesBeganWithEvent)")
        twoFingersTouches = GestureUtils.twoFingersTouches(self, event)
    }
    /**
     * Detects if a two finger left or right swipe has occured
     */
    override func touchesMoved(with event:NSEvent) {
        //Swift.print("touchesMovedWithEvent: " + "\(touchesMovedWithEvent)")
        let swipeType:SwipeType = GestureUtils.swipe(self, event, &twoFingersTouches)
        if (swipeType == .right){
            Swift.print("swipe right")
        }else if(swipeType == .left){
            Swift.print("swipe left")
        }else{
            //Swift.print("swipe none")
        }
    }
    override func touchesEnded(with event: NSEvent) {//for debugging
        //Swift.print("touchesEndedWithEvent: " + "\(touchesEndedWithEvent)")
    }
    override func touchesCancelled(with event: NSEvent) {//for debugging
        //Swift.print("touchesCancelledWithEvent: " + "\(touchesCancelledWithEvent)")
    }
    override func getClassType() -> String {return "\(Graph.self)"}
    required init(coder:NSCoder) { fatalError("init(coder:) has not been implemented")}
}
class Bar:Element{
    
}
//Continue here:
    //Extract the gesture out of CommitGraph✅
    //override createGraph✅
    //create dummy methods with sudo code that calcs the bars and draws them etc✅
    //test it
    //create the touch point visualisations
    //don't do the rounded look before you have the square look working
