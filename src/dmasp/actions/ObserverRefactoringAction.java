package dmasp.actions;

import java.io.FileInputStream;
import java.net.URL;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
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
public class ObserverRefactoringAction implements IWorkbenchWindowActionDelegate {
	private IWorkbenchWindow window;

	/**
	 * The constructor.
	 */
	public ObserverRefactoringAction() {
	}

	private String getInstallLocation() throws Exception {
		Bundle bundle = Platform.getBundle("br.ufscar.dc.rejasp");;
		URL locationUrl = FileLocator.find(bundle,new Path("/"), null);
		URL fileUrl =FileLocator.toFileURL(locationUrl);
		return fileUrl.getFile();
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
		String observerStereotypeName = "";
		String notifyObserverStereotypeName = "";
		String observerType = "";
		String subjectType = "";
		
		observerStereotypeName = getIndicationTree().getStereotype(ConnectionRefactoringAction.OBSERVER);
		notifyObserverStereotypeName = getIndicationTree().getStereotypeMethod(ConnectionRefactoringAction.NOTIFY_OBSERVER);
		observerType = getIndicationTree().getStereotypeMethod(ConnectionRefactoringAction.OBSERVER_TYPE);
		subjectType = getIndicationTree().getStereotypeMethod(ConnectionRefactoringAction.SUBJECT_TYPE);
    	
		if (observerStereotypeName.equalsIgnoreCase("")) {
			InputDialog dlg = new InputDialog(
				 window.getShell(),
		            "Observer Stereotype",
		            "Please, inform the name of stereotype used for observer concern.",
		            null,
		            null); //This is an optional validation class
		    dlg.open();
		    if(dlg.getReturnCode() == Window.OK) {
		    	observerStereotypeName = dlg.getValue();
		    }
		}
		  
		if (notifyObserverStereotypeName.equalsIgnoreCase("")) {
			InputDialog dlg = new InputDialog(
				 window.getShell(),
		            "Notify Observer Stereotype",
		            "Please, inform the name of stereotype used to the notifier method.",
		            null,
		            null); //This is an optional validation class
		    dlg.open();
		    if(dlg.getReturnCode() == Window.OK) {
		    	notifyObserverStereotypeName = dlg.getValue();
		    }
		}

		if (observerType.equalsIgnoreCase("")) {
			InputDialog dlg = new InputDialog(
				 window.getShell(),
		            "Observer Type Stereotype",
		            "Please, inform the name of stereotype used to the observer type.",
		            null,
		            null); //This is an optional validation class
		    dlg.open();
		    if(dlg.getReturnCode() == Window.OK) {
		    	observerType = dlg.getValue();
		    }
		}
		if (subjectType.equalsIgnoreCase("")) {
			InputDialog dlg = new InputDialog(
				 window.getShell(),
		            "Subject Type Stereotype",
		            "Please, inform the name of stereotype used to the subject type.",
		            null,
		            null); //This is an optional validation class
		    dlg.open();
		    if(dlg.getReturnCode() == Window.OK) {
		    	subjectType = dlg.getValue();
		    }
		}

		
		if ((!observerStereotypeName.equalsIgnoreCase("")) && (!notifyObserverStereotypeName.equalsIgnoreCase(""))
				&& (!observerType.equalsIgnoreCase("")) && (!subjectType.equalsIgnoreCase(""))) {
			observerStereotypeName.trim();
			notifyObserverStereotypeName.trim();
			observerType.trim();
			subjectType.trim();
			observerStereotypeName = observerStereotypeName.replaceAll(" ", "");
			notifyObserverStereotypeName = notifyObserverStereotypeName.replaceAll(" ", "");
			observerType = observerType.replaceAll(" ", "");
			subjectType = subjectType.replaceAll(" ", "");

			// Retira prefixo.
			if ((observerStereotypeName.startsWith("Sec_")) || (observerStereotypeName.startsWith("Pri_"))) {
				observerStereotypeName = observerStereotypeName.substring(4);  
			}
		    	
			aspectName = observerStereotypeName + "Aspect";
			System.out.println("ssss" + aspectName);
			
			try {
				DmaspController dmasp = DmaspControllerFactory.getInstance();
				dmasp.initializeProjectMVCASE();
				String ret = dmasp.refObserver(aspectName, observerStereotypeName, notifyObserverStereotypeName, observerType, subjectType);
				if (ret == null){
					dmasp.ObjectToMVCASE(window);
					MessageDialog.openInformation(window.getShell(), "DMAsp+",
						"The connection refactoring was applyed with success.");
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