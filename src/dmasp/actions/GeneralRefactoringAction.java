package dmasp.actions;

import org.eclipse.jface.action.IAction;
import org.eclipse.jface.dialogs.InputDialog;
import org.eclipse.jface.dialogs.MessageDialog;
import org.eclipse.jface.viewers.ISelection;
import org.eclipse.jface.window.Window;
import org.eclipse.ui.IWorkbenchWindow;
import org.eclipse.ui.IWorkbenchWindowActionDelegate;
import org.eclipse.ui.PartInitException;
import org.eclipse.ui.PlatformUI;

import br.ufscar.dc.dmasp.views.RefactoringView;

import dmasp.controller.DmaspController;
import dmasp.controller.DmaspControllerFactory;
import dmasp.exceptions.ProjectNotInitializedException;


/**
 * Our sample action implements workbench action delegate. The action proxy will
 * be created by the workbench and shown in the UI. When the user tries to use
 * the action, this delegate will be created and execution will be delegated to
 * it.
 * 
 * @see IWorkbenchWindowActionDelegate
 */
public class GeneralRefactoringAction implements IWorkbenchWindowActionDelegate {
	private IWorkbenchWindow window;

	/**
	 * The constructor.
	 */
	public GeneralRefactoringAction() {
	}

	public RefactoringView getRefactoringView() {
		try {
			RefactoringView view = (RefactoringView) PlatformUI.getWorkbench().getActiveWorkbenchWindow().getActivePage().showView("br.ufscar.dc.dmasp.views.RefactoringView");
			return view;
		} catch (PartInitException e) {
			return null;
		}
	}

	/**
	 * The action has been activated. The argument of the method represents the
	 * 'real' action sitting in the workbench UI.
	 * 
	 * @see IWorkbenchWindowActionDelegate#run
	 */
	public void run(IAction action) {
		try {
			RefactoringView view = getRefactoringView();
			if (view != null) view.clear();

			String applyedRefactorings = "";
			DmaspController dmasp = DmaspControllerFactory.getInstance();
			dmasp.initializeProjectMVCASE();
			boolean ret = false;

			String stereotypeName = "";
			if (!action.getText().equalsIgnoreCase("&Analyse OO Class Model")) {
				/*InputDialog dlg = new InputDialog(
						window.getShell(),
						"Concern",
						"Please, choose one option (1 or 2):\n 1 - Generate one aspect per class.\n 2 - Generate one aspect per package.",
						null,
						null); //This is an optional validation class
				dlg.open();*/

				
				InputDialog dlg = new InputDialog(
						window.getShell(),
						"Concern",
						"Please, inform the name of concern stereotype. Click in \"Cancel\" to consider all the concerns.",
						null,
						null); //This is an optional validation class
				dlg.open();
				if(dlg.getReturnCode() == Window.OK) {
					stereotypeName = dlg.getValue();
				}

				if (action.getText().equalsIgnoreCase("&Apply Refactoring 1")) {
					ret = dmasp.ref1(stereotypeName);
					if (ret == true) applyedRefactorings = "1";
				} else if (action.getText().equalsIgnoreCase("&Apply Refactoring 2")) {
					ret = dmasp.ref2(stereotypeName);
					if (ret == true) applyedRefactorings = "2";
				}
				else if (action.getText().equalsIgnoreCase("&Apply Refactoring 3")) {
					ret = dmasp.ref3(stereotypeName);
					if (ret == true) applyedRefactorings = "3";
				}
				dmasp.ObjectToMVCASE(window);
				if (!applyedRefactorings.equalsIgnoreCase("")) { 
					MessageDialog.openInformation(window.getShell(), "DMAsp+",
							"The general refactoring(s) " + applyedRefactorings + " was(were) applyed with success.");
				} else {
					MessageDialog.openInformation(window.getShell(), "DMAsp+",
					"There are not refactorings to be applyed.");
				}
			} else {
				System.out.println("entrou");
				String stereotypesRef1 = dmasp.analyseref1();
				System.out.println("saiu1");
				String stereotypesRef2 = dmasp.analyseref2();
				System.out.println("saiu2");
				String stereotypesRef3 = dmasp.analyseref3();
				System.out.println("saiu3");
				MessageDialog.openInformation(window.getShell(), "DMAsp+",
						"Concern(s) that can be refactored with: \nRefactoring one: " + stereotypesRef1 + "\n" +
						"Refactoring two: " + stereotypesRef2 + "\n" +
						"Refactoring three: " + stereotypesRef3 + "\n");
			}

		} catch (ProjectNotInitializedException prjEx) {
			MessageDialog.openInformation(window.getShell(), "DMAsp+",
					"Project is not generated. Please, run the ComSCId plugin.");
		} 
	}

	/**
	 * Selection in the workbench has been changed. We can change the state of
	 * the 'real' action here if we want, but this can only happen after the
	 * delegate has been created.
	 * 
	 * @see IWorkbenchWindowActionDelegate#selectionChanged
	 */
	public void selectionChanged(IAction action, ISelection selection) {
	}

	/**
	 * We can use this method to dispose of any system resources we previously
	 * allocated.
	 * 
	 * @see IWorkbenchWindowActionDelegate#dispose
	 */
	public void dispose() {
	}

	/**
	 * We will cache window object in order to be able to provide parent shell
	 * for the message dialog.
	 * 
	 * @see IWorkbenchWindowActionDelegate#init
	 */
	public void init(IWorkbenchWindow window) {
		this.window = window;
	}
}