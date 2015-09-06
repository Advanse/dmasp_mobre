package dmasp.actions;

import java.io.File;
import java.io.FileInputStream;
import java.net.URL;
import java.util.Iterator;

import javax.xml.transform.TransformerFactory;

import org.eclipse.core.runtime.FileLocator;
import org.eclipse.core.runtime.Path;
import org.eclipse.core.runtime.Platform;
import org.eclipse.jface.action.ContributionItem;
import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.widgets.Menu;
import org.eclipse.swt.widgets.MenuItem;
import org.osgi.framework.Bundle;

import br.ufscar.dc.dmasp.controller.DmaspFactory;
import br.ufscar.dc.dmasp.model.Project;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;

public class MydynamicMenu extends ContributionItem {
	
	private XStream stream;
	private TransformerFactory transformerFactory;
	private UserRefactorings refs;
	
	public MydynamicMenu() {
	}
 
	public MydynamicMenu(String id) {
		super(id);
	}

	private String getInstallLocation() throws Exception {
		Bundle bundle = Platform.getBundle("br.ufscar.dc.dmasp");
		URL locationUrl = FileLocator.find(bundle, new Path("/"), null);
		URL fileUrl = FileLocator.toFileURL(locationUrl);
		return fileUrl.getFile();
	}

	private void createAliases() {
		this.stream = new XStream(new DomDriver());
		this.transformerFactory = TransformerFactory.newInstance();
		this.refs = new UserRefactorings();

		stream.alias("userrefactorings", UserRefactorings.class);
		stream.alias("refactoring", MyRefactoring.class);
	}
	
	public void XMLToObject() {
		createAliases();
		try {
			String modelXML = getInstallLocation() + "/myrefs.xml"; 
			File fileXmlIn = new File(modelXML);
			if (fileXmlIn.exists()) {
				refs = (UserRefactorings) stream
						.fromXML(new FileInputStream(modelXML));
			} else {
				System.out.println("Arquivo \"" + modelXML + "\" inexistente.");
			}
			System.out.println("22222");
		} catch (Throwable ex) {
			System.out.println("Ocorreu um erro ao ler o arquivo XML.");
		} 
	}
	
	
	@Override
	public void fill(Menu menu, int index) {
		XMLToObject();
		Iterator<MyRefactoring> it = refs.getLstRef().iterator();

		while(it.hasNext()) {
			MyRefactoring myref = it.next();

			MenuItem menuItem = new MenuItem(menu, SWT.DEFAULT, index);
			menuItem.setText(myref.getName());
			if (myref.getHandler() != null) { 
				try {
					Class handler = Class.forName(myref.getHandler());
					menuItem.addSelectionListener((SelectionAdapter) handler.newInstance());
				} catch(Exception iex) {
					iex.printStackTrace();
					System.out.println("Adapter class not defined");					
				}
			}
		}				
	}

}