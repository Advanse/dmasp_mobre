package dmasp.actions;

import java.net.URL;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.digester.Rule;
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

import br.ufscar.dc.rejasp.indication.model.Indication;
import br.ufscar.dc.rejasp.indication.model.MatchText;
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
public class ConnectionRefactoringAction implements IWorkbenchWindowActionDelegate {
	private IWorkbenchWindow window;
	/**
	 * Constants
	 */
	public static final String CONNECTION = "Connection";
	public static final String OPEN_CONNECTION = "Open Connection";
	public static final String CLOSE_CONNECTION = "Close Connection";
	public static final String TRANSACTION = "Transaction";
	public static final String SYN = "Synchronization";
	public static final String LOGGING = "Logging";
	public static final String ENTRY_LOGGING = "Entry Logging";
	public static final String EXIT_LOGGING = "Exit Logging";
	public static final String PERSISTENT = "Persistent";
	public static final String OBSERVER = "Observer";
	public static final String NOTIFY_OBSERVER = "Notify Observer";
	public static final String SINGLETON = "Singleton";
	public static final String SINGLECLASS = "Single Class";
	public static final String OBSERVER_TYPE = "Observer Type";
	public static final String SUBJECT_TYPE = "Subject Type";

	/**
	 * The constructor.
	 */
	public ConnectionRefactoringAction() {
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
		String connStereotypeName = "";
		String openConnStereotypeName = "";
		String closeConnStereotypeName = "";
		
		connStereotypeName = getIndicationTree().getStereotype(CONNECTION);
		openConnStereotypeName = getIndicationTree().getStereotypeMethod(OPEN_CONNECTION);
		closeConnStereotypeName = getIndicationTree().getStereotypeMethod(CLOSE_CONNECTION);
		
		if (connStereotypeName.equalsIgnoreCase("")) {
			InputDialog dlg = new InputDialog(
				 window.getShell(),
		            "Connection Stereotype",
		            "Please, inform the name of stereotype used for connection management.",
		            null,
		            null); //This is an optional validation class
		    dlg.open();
		    if(dlg.getReturnCode() == Window.OK) {
		    	connStereotypeName = dlg.getValue();
		    }
		}
		  
		if (openConnStereotypeName.equalsIgnoreCase("")) {
			InputDialog dlg = new InputDialog(
				 window.getShell(),
		            "Open Connection Method",
		            "Please, inform the method name used to open a connection.",
		            null,
		            null); //This is an optional validation class
		    dlg.open();
		    if(dlg.getReturnCode() == Window.OK) {
		    	openConnStereotypeName = dlg.getValue();
		    }
		}

		if (closeConnStereotypeName.equalsIgnoreCase("")) {
			InputDialog dlg = new InputDialog(
				 window.getShell(),
		            "Close Connection Method",
		            "Please, inform the method name used to close a connection.",
		            null,
		            null); //This is an optional validation class
		    dlg.open();
		    if(dlg.getReturnCode() == Window.OK) {
		    	closeConnStereotypeName = dlg.getValue();
		    }
		}

		if ((!connStereotypeName.equalsIgnoreCase("")) && (!openConnStereotypeName.equalsIgnoreCase("")) && (!closeConnStereotypeName.equalsIgnoreCase(""))) {
			connStereotypeName.trim();
			openConnStereotypeName.trim();
			closeConnStereotypeName.trim();
			connStereotypeName = connStereotypeName.replaceAll(" ", "");
			openConnStereotypeName = openConnStereotypeName.replaceAll(" ", "");
			closeConnStereotypeName = closeConnStereotypeName.replaceAll(" ", "");

			// Retira prefixo.
			if ((connStereotypeName.startsWith("Sec_")) || (connStereotypeName.startsWith("Pri_"))) {
				connStereotypeName = connStereotypeName.substring(4);  
			}
		    	
			// Retira prefixo.
			if ((openConnStereotypeName.startsWith("Sec_")) || (openConnStereotypeName.startsWith("Pri_"))) {
				openConnStereotypeName = openConnStereotypeName.substring(4);  
			}

			// Retira prefixo.
			if ((closeConnStereotypeName.startsWith("Sec_")) || (closeConnStereotypeName.startsWith("Pri_"))) {
				closeConnStereotypeName = closeConnStereotypeName.substring(4);  
			}

			aspectName = connStereotypeName + "Aspect";

			try {
				DmaspController dmasp = DmaspControllerFactory.getInstance();
				dmasp.initializeProjectMVCASE();
				String ret = dmasp.refConnection(aspectName, connStereotypeName, openConnStereotypeName, closeConnStereotypeName);
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