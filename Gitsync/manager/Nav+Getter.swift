import Cocoa
import Spatial_macOS
import With_mac

extension Nav {
   /**
    * getView
    */
   static func getView(viewType: ViewType) -> NSView? {
      guard let mainView: MainView = NSApp.windows.first?.contentView as? MainView else { Swift.print("no mainview"); return nil }
      Swift.print(" mainView:  \(mainView)")
      // Fixme: ⚠️️ you need to call .close to tidy up things
      Swift.print("mainView.curSubView:  \(mainView.subviews.first)")
      if let curSubView = mainView.subviews.first { Swift.print("remove curSubView"); curSubView.removeFromSuperview() } /*Remove it if it exists*/
      
      switch viewType {
      case .dialog(_):
         Swift.print("dialog view")
          return nil
      case .commitList:
         Swift.print("commitList view")
         return Nav.createCommitListView(view: mainView)
      case .commitDetail(let title):
         Swift.print("commitdetail view: \(title)")
         _ = title
         return Nav.createCommitDetailView(view: mainView)
      case .prefs(let prefsType):
         switch prefsType {
         case .prefsList:
            Swift.print("prefslist")
             return nil
         case.repo(let repoType):
            switch repoType {
            case .repoList:
               Swift.print("repoList")
                return nil
            case .repoDetail(let repoName):
               Swift.print("repo detail: \(repoName)")
                return nil
            }
         }
      }
      
      //get win
      //from winParser, just add to bottom of class
      //get view
      //get curDialogView
      //get curView
   }
   //   private static func getView(_ viewType: ViewType, _ view: Element) -> NSView {
   //      switch viewType {
   //      case .main(let viewType): /* Main */
   //         switch viewType {
   //         case .commit:
   //            let commitView: CommitView = .init()
   //            return view.addSubview(commitView)
   //         case .prefs:
   //            let prefsView: PrefsView = .init()
   //            return view.addSubview(prefsView)
   //         }
   //      case .detail(let viewType):/*Detail*/
   //         switch viewType {
   //         case .commit(let commitData):/*CommitDetail*/
   //            let view: CommitDetailView = view.addSubView(CommitDetailView())
   //            view.setCommitData(commitData)/*Updates the UI elements with the selected commit item*/
   //            return view
   //         case .repo(let idx3d):/*RepoDetail*/
   //            RepoView.selectedListItemIndex = idx3d
   //            let view: RepoDetailView = view.addSubView(RepoDetailView())
   //            view.setRepoData()
   //            return view
   //         }
   //      case .dialog(let dialog):/*Dialogs*/
   //         _ = dialog
   //         switch dialog{
   //         case .commit(let repoItem, let commitMessage, let onComplete):
   //            let view = CommitDialogView()
   //            view.addSubview(view)
   //            Swift.print("onComplete: " + "\(onComplete)")
   //            view.setData(repoItem, commitMessage, onComplete)
   //            return view
   //         case .conflict(let mergeConflict):
   //            let view = MergeConflictView()
   //            view.addSubview(view)
   //            view.setData(mergeConflict)
   //            return view
   //         case .autoInit(let autoInitConflict,let onComplete):
   //            let view = AutoInitView()
   //            view.addSubview(view)
   //            view.setData(autoInitConflict, onComplete)
   //            return view
   //         }
   //      }
   //   }
   
}



//MacOS has strange default compression priorities: https://stackoverflow.com/questions/39013002/why-adding-constraints-removes-the-ability-to-resize-nswindow
//      list.setContentCompressionResistancePriority(NSLayoutConstraint.Priority(rawValue: 249), for: NSLayoutConstraint.Orientation.horizontal)
//      list.setContentCompressionResistancePriority(NSLayoutConstraint.Priority(rawValue: 249), for: NSLayoutConstraint.Orientation.vertical)
