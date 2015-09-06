package br.ufscar.dc.dmasp.views;


import org.eclipse.jface.action.IMenuManager;
import org.eclipse.jface.action.IToolBarManager;
import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Tree;
import org.eclipse.swt.widgets.TreeColumn;
import org.eclipse.swt.widgets.TreeItem;
import org.eclipse.ui.part.ViewPart;


/**
 * This sample class demonstrates how to plug-in a new
 * workbench view. The view shows data obtained from the
 * model. The sample creates a dummy model on the fly,
 * but a real implementation would connect to the model
 * available either in this or another plug-in (e.g. the workspace).
 * The view is connected to the model using a content provider.
 * <p>
 * The view uses a label provider to define how model
 * objects should be presented in the view. Each
 * view can present the same model objects using
 * different labels and icons, if needed. Alternatively,
 * a single label provider can be shared between views
 * in order to ensure that objects of the same type are
 * presented in the same way everywhere.
 * <p>
 */

public class RefactoringView extends ViewPart {
	
	private Tree tree; 

	public void createPartControl(Composite parent) {
		tree = new Tree(parent, SWT.BORDER | SWT.H_SCROLL | SWT.V_SCROLL);
	    tree.setHeaderVisible(true);
	    TreeColumn column1 = new TreeColumn(tree, SWT.LEFT);
	    column1.setText("Refactoring Steps");
	    column1.setWidth(1000);
	    
	}
	 
	public void addItem(String text) {
		if (tree != null) {
			TreeItem[] itens = tree.getItems();
			boolean achou = false;
			for (int i = 0; ((i < itens.length) && (!achou)); i++) {
				TreeItem itemAux = itens[i];
				if (itemAux.getText().equalsIgnoreCase(text)) achou = true;
			}
			if (!achou) {
				TreeItem item = new TreeItem(tree, SWT.NONE);
				item.setText(new String[] { text });
			}
		}
	}

	public void addSubItem(String item, String text) {
		if (tree != null) {
			TreeItem[] itens = tree.getItems();
			for (int i = 0; i < itens.length; i++) {
				TreeItem itemAux = itens[i];
				if (itemAux.getText().equalsIgnoreCase(item)) {
					TreeItem subItem = new TreeItem(itemAux, SWT.NONE);
					subItem.setText(new String[] { text });
				}
			}
		}
	}
	
	public boolean isExist(String item, boolean clean) {
		if (tree != null) {
			TreeItem[] itens = tree.getItems();
			for (int i = 0; i < itens.length; i++) {
				TreeItem itemAux = itens[i];
				if (itemAux.getText().equalsIgnoreCase(item)) {
					if (clean) itemAux.removeAll();
					return true;
				}
			}
		}
		return false;
	}

	
	public void clear() {
		if (tree != null) {
			TreeItem[] itens = tree.getItems();
			for (int i = 0; i < itens.length; i++) {
				TreeItem itemAux = itens[i];
				itemAux.removeAll();
				itemAux.dispose();
			}
		}
	}

	private void hookContextMenu() {
	}

	private void contributeToActionBars() {
	}

	private void fillLocalPullDown(IMenuManager manager) {
	}

	private void fillContextMenu(IMenuManager manager) {
	}
	
	private void fillLocalToolBar(IToolBarManager manager) {
	}

	private void makeActions() {
	}

	private void hookDoubleClickAction() {
	}
	private void showMessage(String message) {
	}

	/**
	 * Passing the focus request to the viewer's control.
	 */
	public void setFocus() {
	}
}