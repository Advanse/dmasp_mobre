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
public class LoggingRefactoringAction implements IWorkbenchWindowActionDelegate {
	private IWorkbenchWindow window;

	/**
	 * The constructor.
	 */
	public LoggingRefactoringAction() {
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
		String loggingStereotypeName = "";
		String entryLoggingStereotypeName = "";
		String exitLoggingStereotypeName = "";

		loggingStereotypeName = getIndicationTree().getStereotype(ConnectionRefactoringAction.LOGGING);
		entryLoggingStereotypeName = getIndicationTree().getStereotypeMethod(ConnectionRefactoringAction.ENTRY_LOGGING);
		exitLoggingStereotypeName = getIndicationTree().getStereotypeMethod(ConnectionRefactoringAction.EXIT_LOGGING);
	
		if (loggingStereotypeName.equalsIgnoreCase("")) {
			InputDialog dlg = new InputDialog(
					window.getShell(),
				    "Logging Stereotype",
				    "Please, inform the name of stereotype used for logging.",
				    null,
				    null); //This is an optional validation class
			dlg.open();
		    if(dlg.getReturnCode() == Window.OK) {
		    	loggingStereotypeName = dlg.getValue();
		    }
		}
		
		if (entryLoggingStereotypeName.equalsIgnoreCase("")) {
			InputDialog dlg = new InputDialog(
					window.getShell(),
				    "Entry Logging Stereotype",
				    "Please, inform the name of stereotype used for entry logging.",
				    null,
				    null); //This is an optional validation class
			dlg.open();
		    if(dlg.getReturnCode() == Window.OK) {
		    	entryLoggingStereotypeName = dlg.getValue();
		    }
		}
		
		if (exitLoggingStereotypeName.equalsIgnoreCase("")) {
			InputDialog dlg = new InputDialog(
					window.getShell(),
				    "Exit Logging Stereotype",
				    "Please, inform the name of stereotype used for exit logging.",
				    null,
				    null); //This is an optional validation class
			dlg.open();
		    if(dlg.getReturnCode() == Window.OK) {
		    	exitLoggingStereotypeName = dlg.getValue();
		    }
		}

		if ((!loggingStereotypeName.equalsIgnoreCase("")) && (!entryLoggingStereotypeName.equalsIgnoreCase("")) && (!exitLoggingStereotypeName.equalsIgnoreCase(""))) {
			loggingStereotypeName.trim();
			entryLoggingStereotypeName.trim();
			exitLoggingStereotypeName.trim();
			loggingStereotypeName = loggingStereotypeName.replaceAll(" ", "");
			entryLoggingStereotypeName = entryLoggingStereotypeName.replaceAll(" ", "");
			exitLoggingStereotypeName = exitLoggingStereotypeName.replaceAll(" ", "");

			// Retira prefixo.
			if ((loggingStereotypeName.startsWith("Sec_")) || (loggingStereotypeName.startsWith("Pri_"))) {
				loggingStereotypeName = loggingStereotypeName.substring(4);  
			}

			// Retira prefixo.
			if ((entryLoggingStereotypeName.startsWith("Sec_")) || (entryLoggingStereotypeName.startsWith("Pri_"))) {
				entryLoggingStereotypeName = entryLoggingStereotypeName.substring(4);  
			}
		    	
			// Retira prefixo.
			if ((exitLoggingStereotypeName.startsWith("Sec_")) || (exitLoggingStereotypeName.startsWith("Pri_"))) {
				exitLoggingStereotypeName = exitLoggingStereotypeName.substring(4);  
			}

			aspectName = loggingStereotypeName + "Aspect";
				    	
			try {
			   		DmaspController dmasp = DmaspControllerFactory.getInstance();
			   		dmasp.initializeProjectMVCASE();
			   		String ret = dmasp.refLogging(aspectName, loggingStereotypeName, entryLoggingStereotypeName, exitLoggingStereotypeName);
			   		if (ret == null){
			   			dmasp.ObjectToMVCASE(window);
			   			MessageDialog.openInformation(window.getShell(), "DMAsp+",
			   				"The logging refactoring was applyed with success.");
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