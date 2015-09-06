package dmasp.actions;

import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;

public class HandlerA extends SelectionAdapter {
	public void widgetSelected(SelectionEvent e) {
		//what to do when menu is subsequently selected.
		System.err.println("A");
		
	}
}
