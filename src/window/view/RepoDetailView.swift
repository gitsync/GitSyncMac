import Foundation

class RepoDetailView:Element{
    var nameTextInput:TextInput?
    var localPathTextInput:TextInput?
    var remotePathTextInput:TextInput?
    override func resolveSkin() {
        super.resolveSkin()
        
        StyleManager.addStyle("RepoDetailView TextInput Text{width:90px;}")
        StyleManager.addStyle("RepoDetailView TextInput TextArea{width:130px;}RepoDetailView TextInput TextArea Text{width:120px;}")
        StyleManager.addStyle("RepoDetailView TextInput TextArea{drop-shadow:none;line-alpha:0;line-thickness:0px;}")
        
        let repoData = RepoData.sharedInstance
        let repoItem = repoData.dp!.getItemAt(0)!
        
        //Name: (TextInput)
        nameTextInput = addSubView(TextInput(width, 32, "Name: ", repoItem["title"]!, self))
        //Local-path: (TextInput)
        localPathTextInput = addSubView(TextInput(width, 32, "Local-path: ", repoItem["local-path"]!, self))
        //Remote-path: (TextInput)
        remotePathTextInput = addSubView(TextInput(width, 32, "Remote-path: ", repoItem["remote-path"]!, self))
        //Broadcast: (CheckBox Button)
        let checkBoxButton1 = section.addSubView(CheckBoxButton(NaN, NaN,"Option 1",true,section))
        //SubScribe: (CheckBox Button)
        //Auto-sync: (CheckBox Button)
        //Auto-sync-Interval: (LeverSlider)
        
    }
}
