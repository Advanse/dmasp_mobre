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
public class TransactionRefactoringAction implements IWorkbenchWindowActionDelegate {
	private IWorkbenchWindow window;

	/**
	 * The constructor.
	 */
	public TransactionRefactoringAction() {
	}

	private String getInstallLocation() throws Exception {
		Bundle bundle = Platform.getBundle("br.ufscar.dc.rejasp");;
		URL locationUrl = FileLocator.find(bundle,new Path("/"), null);
		URL fileUrl =FileLocator.toFileURL(locationUrl);
		return fileUrl.getFile();
	}
	
	/**
	 * The action has been activated. The argument of the method represents the
	 * 'real' action sitting in the workbench UI.
	 * 
	 * @see IWorkbenchWindowActionDelegate#run
	 */
	public void run(IAction action) {
		String aspectName = "";
		String stereotypeName = "";
		try { 
			Properties propertiesFile = new Properties();
			propertiesFile.load(new FileInputStream(getInstallLocation()+"/propertiesIndications.properties")); 
			Enumeration<Object> lstKeys = propertiesFile.keys();
			boolean stop = false;
			String indication = "";
			String strkey = "";
			while ((!stop) && (lstKeys.hasMoreElements())) {
				Object key = lstKeys.nextElement();
				strkey = (String) key;
				indication = propertiesFile.getProperty(strkey);
				if ((indication.equalsIgnoreCase(ConnectionRefactoringAction.TRANSACTION))) stop = true;
			}
			if (stop == true) stereotypeName = strkey;
			
		} catch (Exception e) { 
			System.out.println("It was not possible to open the properties file.");
		} 
    	
		if (stereotypeName.equalsIgnoreCase("")) {
			InputDialog dlg = new InputDialog(
					window.getShell(),
				    "Transaction Stereotype",
				    "Please, inform the name of stereotype used for transaction management.",
				    null,
				    null); //This is an optional validation class
			dlg.open();
		    if(dlg.getReturnCode() == Window.OK) {
		    	stereotypeName = dlg.getValue();
		    }
		}

		if (!stereotypeName.equalsIgnoreCase("")) {
			stereotypeName.trim();
			stereotypeName = stereotypeName.replaceAll(" ", "");

			// Retira prefixo.
			if ((stereotypeName.startsWith("Sec_")) || (stereotypeName.startsWith("Pri_"))) {
				stereotypeName = stereotypeName.substring(4);  
			}
		    	
			aspectName = stereotypeName + "Aspect";
				    	
			try {
				DmaspController dmasp = DmaspControllerFactory.getInstance();
				dmasp.initializeProjectMVCASE();
				String ret = dmasp.refTransaction(aspectName, stereotypeName);
				if (ret == null){
					dmasp.ObjectToMVCASE(window);
				    MessageDialog.openInformation(window.getShell(), "DMAsp+",
				    "The transaction refactoring was applyed with success.");
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