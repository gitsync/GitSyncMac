import Cocoa
@testable import Utils
@testable import Element
@testable import GitSyncMac

//Continue here:
    //FastList (progressable) ✅
    //ScrolFastlList ✅
    //SlideFastList ✅

    //slideScrollFastList 👈
    //ElasticFastList
    //ElasticSlideFastList

    //Add css so that Sliders are aligned in SliderList3 and SliderView3 ⏳⏳
    //Figure out the primary direction calculations for momentum, (maybe later) (Make UniScrollable sort of scroll in the intentional direction while not directly Manipulated)

    //convert Element to use v3 of scroll protocols ⏳⏳⏳
    //move Gradient etc to dedicated repos, move graph to dedicated proj, colorPanel etc ⏳⏳
    //make Awesome-Element where you have gradient, colorpanel, graph etc


class TestView:TitleView{
    override init(_ width:CGFloat, _ height:CGFloat, _ parent:IElement? = nil, _ id:String? = "") {
        //self.title = "Resolve merge conflict:"//Title: Resolve sync conflict:
        super.init(width, height, parent, "listTransitionTestView")
    }
    override func resolveSkin(){
        Swift.print("ListTransitionTestView.resolveSkin()")
        super.resolveSkin()
        //Swift.print(ElementParser.stackString(self))
        createGUI()
    }
    func createGUI(){
        elasticScrollFastList()
        //slideScrollFastList()
        //scrollFastList()
        //fastList()
        
        //createElasticScrollSlideList()
        //createElasticScrollList()
        //createSlideScrollList()
        //createScrollList()
        //createList()
        
        //_ = self.addSubView(ElasticSlideScrollView3Test(width,height,nil))
        //_ = self.addSubView(ElasticScrollView3Test(width,height,nil))
        //_ = self.addSubView(SlideScrollView3Test(width,height,nil))
        
        //createGraph7Test()
        //createGraph2()
        //createVerSlider()
        //createHorSlider()
        
        //createVSlider()
        
        /*let intervalA:CGFloat = floor(200 - 100)/24
         Swift.print("intervalA: " + "\(intervalA)")
         let intervalB = SliderParser.interval(200, 100, 20)
         Swift.print("intervalB: " + "\(intervalB)")*/
    }
    func elasticScrollFastList(){
        var dp:DataProvider
        dp = DataProvider("~/Desktop/assets/xml/longlist.xml".tildePath)
        _ = self.addSubView(ElasticScrollFastList3(140, 145, CGSize(24,24), dp, self))
    }
    func slideScrollFastList(){
        var dp:DataProvider
        dp = DataProvider("~/Desktop/assets/xml/scrollist.xml".tildePath)
        _ = self.addSubView(SlideScrollFastList3(140, 73, CGSize(24,24), dp, self))
    }
    func scrollFastList(){
        var dp:DataProvider
        dp = DataProvider("~/Desktop/assets/xml/scrollist.xml".tildePath)
        _ = self.addSubView(ScrollFastList3(140, 73, CGSize(24,24), dp, self))
    }
    func fastList(){
        let dp:DataProvider = DataProvider("~/Desktop/assets/xml/scrollist.xml".tildePath)
        let list = addSubView(FastList3(140,73,CGSize(24,24),dp,self))
        _ = list
    }
    /**
     *
     */
    func createElasticScrollSlideList(){
        let dp:DataProvider = DataProvider("~/Desktop/assets/xml/scrollist.xml".tildePath)//longlist.xml
        dp.addItem(["title":"pink"])
        dp.addItem(["title":"orange"])
        dp.addItem(["title":"purple"])
        let list = addSubView(ElasticSlideScrollList3(140,145,CGSize(24,24),dp,.ver,self))
        _ = list
    }
    /**
     *
     */
    func createElasticScrollList(){
        let dp:DataProvider = DataProvider("~/Desktop/assets/xml/scrollist.xml".tildePath)
        let list = addSubView(ElasticScrollList3(140,145,CGSize(24,24),dp,.ver,self))
        _ = list
    }
    func createSlideScrollList(){
        let dp:DataProvider = DataProvider("~/Desktop/assets/xml/scrollist.xml".tildePath)
        let list = addSubView(SlideScrollList3(140,145,CGSize(24,24),dp,.ver,self))
        _ = list
    }
    func createScrollList(){
        let dp:DataProvider = DataProvider("~/Desktop/assets/xml/scrollist.xml".tildePath)
        let list = addSubView(ScrollList3(140,145,CGSize(NaN,24),dp,.ver,self))
        _ = list
    }
    func createList(){/*list.xml*/
        let dp = DataProvider(FileParser.xml("~/Desktop/ElCapitan/assets/xml/scrollist.xml".tildePath))/*Loads xml from a xml file on the desktop*/
        let list = self.addSubView(List3(140, 144, CGSize(NaN,NaN), dp,.ver,self))
        _ = list
    }
    
    func createVerSlider(){
        let horSlider:Slider = self.addSubView(Slider(6,60,.ver,CGSize(6,30),0,self))
        _ = horSlider
    }
    func createHorSlider(){
        let horSlider:Slider = self.addSubView(Slider(60,6,.hor,CGSize(30,6),0,self))
        _ = horSlider
    }
    /**
     * NOTE: see VolumSlider for eventListener
     */
    func createVSlider(){
        let vSlider:VSlider = self.addSubView(VSlider(6,60,30,0,self))
        _ = vSlider
    }
    func createGraph7Test(){
        let test = self.addSubView(Graph7(width,height-48,self))
        _ = test
    }
    func createGraph2(){
        let graph = self.addSubView(Graph2(width,height,nil))
        _ = graph
    }
    
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
class SlideScrollView3Test:SlideScrollView3 /*ElasticSlideScrollView3 ,ElasticView3*/{
    override var contentSize: CGSize {return CGSize(super.width*2,super.height*2)}
    override func resolveSkin() {
        StyleManager.addStyle("SlideScrollView3Test{fill:green;fill-alpha:0.0;}")
        super.resolveSkin()
        createEllipse()
    }
}
class ElasticScrollView3Test:ElasticScrollView3{
    override var contentSize: CGSize {return CGSize(super.width*2,super.height*2)}
    override func resolveSkin() {
        StyleManager.addStyle("ElasticScrollView3Test{fill:green;fill-alpha:0.0;}")
        super.resolveSkin()
        createEllipse()
    }
}
class ElasticSlideScrollView3Test:ElasticSlideScrollView3{
    override var contentSize: CGSize {return CGSize(super.width*2,super.height*2)}
    override func resolveSkin() {
        StyleManager.addStyle("ElasticSlideScrollView3Test{fill:green;fill-alpha:0.0;}")
        super.resolveSkin()
        createEllipse()
    }
}
