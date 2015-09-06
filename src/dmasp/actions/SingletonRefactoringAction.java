package dmasp.actions;

import java.io.FileInputStream;
import java.net.URL;
import java.util.Enumeration;
import java.util.Properties;

import org.eclipse.core.runtime.FileLocator;
import org.eclipse.core.runtime.Path;
import org.eclipse.core.runtime.Platform;
import org.eclipse.jface.action.IAction;
import org.eclipse.jface.dialogs.InputDialog;
import org.eclipse.jface.dialogs.MessageDialog;
import org.eclipse.jface.viewers.ISelection;
import org.eclipse.jface.window.Window;
import org.eclipse.ui.IWorkbenchWindow;
import org.eclipse.ui.IWorkbenchWindowActionDelegate;
import org.osgi.framework.Bundle;

import br.ufscar.dc.rejasp.views.IndicationTree;

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
public class SingletonRefactoringAction implements IWorkbenchWindowActionDelegate {
	private IWorkbenchWindow window;

	/**
	 * The constructor.
	 */
	public SingletonRefactoringAction() {
	}

	public IndicationTree getIndicationTree() {
		IndicationTree viewer = (IndicationTree) window.getWorkbench().getActiveWorkbenchWindow().getActivePage().findView("br.ufscar.dc.rejasp.views.IndicationTree");
		return viewer;
	}
	/**
	 * The action has been activated. The argument of the method represents the
	 * 'real' action sitting in the workbench UI.
	 * 
	 * @see IWorkbenchWindowActionDelegate#run
	 */
	public void run(IAction action) {
		String aspectName = "";
		String singletonStereotypeName = "";
		String singleClassName = "";
	
		singletonStereotypeName = getIndicationTree().getStereotype(ConnectionRefactoringAction.SINGLETON);
		singleClassName = getIndicationTree().getStereotypeMethod(ConnectionRefactoringAction.SINGLECLASS);

		if (singletonStereotypeName.equalsIgnoreCase("")) {
			InputDialog dlg = new InputDialog(
					window.getShell(),
					"Singleton Stereotype",
				    "Please, inform the name of stereotype used for singleton concern.",
				    null,
				    null); //This is an optional validation class
			dlg.open();
		    if(dlg.getReturnCode() == Window.OK) {
		    	singletonStereotypeName = dlg.getValue();
		    }
		}

		if (singleClassName.equalsIgnoreCase("")) {
			InputDialog dlg1 = new InputDialog(
					window.getShell(),
					"Single Class Name",
				    "Please, inform the name of the single class.",
				    null,
				    null); //This is an optional validation class
			dlg1.open();
		    if(dlg1.getReturnCode() == Window.OK) {
		    	singleClassName = dlg1.getValue();
		    }
		}

		if ((!singletonStereotypeName.equalsIgnoreCase("")) && (!singleClassName.equalsIgnoreCase(""))) {
			singletonStereotypeName.trim();
			singleClassName.trim();
				    	
			singletonStereotypeName = singletonStereotypeName.replaceAll(" ", "");
			singleClassName = singleClassName.replaceAll(" ", "");

			// Retira prefixo.
			if ((singletonStereotypeName.startsWith("Sec_")) || (singletonStereotypeName.startsWith("Pri_"))) {
				singletonStereotypeName = singletonStereotypeName.substring(4);  
			}
		    	
			aspectName = singletonStereotypeName + "Aspect";
		
	    	try {
	    		DmaspController dmasp = DmaspControllerFactory.getInstance();
	    		dmasp.initializeProjectMVCASE();
	    		String ret = dmasp.refSingleon(aspectName, singletonStereotypeName, singleClassName);
	    		if (ret == null){
	    			dmasp.ObjectToMVCASE(window);
					MessageDialog.openInformation(window.getShell(), "DMAsp+",
						"The singleton refactoring was applyed with success.");
				} else {
					MessageDialog.openError(window.getShell(), "DMAsp+",
							ret);				    			
				}				    	
			} catch (ProjectNotInitializedException prjEx) {
				MessageDialog.openInformation(window.getShell(), "DMAsp+",
				"Project is not generated. Please, run the ComSCId plugin.");
			}
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