package dmasp.actions;

import org.eclipse.jface.action.IAction;
import org.eclipse.jface.dialogs.MessageDialog;
import org.eclipse.jface.viewers.ISelection;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.ui.IWorkbenchWindow;

import br.ufscar.dc.dmasp.model.Project;
import dmasp.controller.DmaspController;
import dmasp.controller.DmaspControllerFactory;
import dmasp.exceptions.ProjectNotInitializedException;

public class IdentifyResourceRefactoring extends RefactoringHandler {
	public void widgetSelected(SelectionEvent e) {
		try {
			DmaspController dmasp = DmaspControllerFactory.getInstance();
			dmasp.initializeProject();
			Project prj = dmasp.getProject();
			// Procedimento da refatoração
			dmasp.ObjectToXML(window);
		} catch (ProjectNotInitializedException prjEx) {
			MessageDialog.openInformation(window.getShell(), "DMAsp+",
				"Project is not generated. Please, run the ComSCId plugin.");
		}
	}
}
