package dmasp.actions;

import org.eclipse.jface.action.IAction;
import org.eclipse.jface.viewers.ISelection;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.ui.IWorkbenchWindow;
import org.eclipse.ui.IWorkbenchWindowActionDelegate;

public abstract class RefactoringHandler extends SelectionAdapter implements IWorkbenchWindowActionDelegate {
	protected IWorkbenchWindow window;
	public abstract void widgetSelected(SelectionEvent e);
	public void init(IWorkbenchWindow window) {
		this.window = window;
	}
	@Override
	public void dispose() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void run(IAction arg0) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void selectionChanged(IAction arg0, ISelection arg1) {
		// TODO Auto-generated method stub
		
	}
}
