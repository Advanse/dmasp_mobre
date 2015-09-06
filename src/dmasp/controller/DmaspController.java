package dmasp.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.eclipse.core.runtime.FileLocator;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.Path;
import org.eclipse.core.runtime.Platform;
import org.eclipse.jdt.core.dom.CompilationUnit;
import org.eclipse.jface.dialogs.ProgressMonitorDialog;
import org.eclipse.jface.operation.IRunnableWithProgress;
import org.eclipse.ui.IWorkbenchWindow;
import org.eclipse.ui.PartInitException;
import org.eclipse.ui.PlatformUI;
import org.osgi.framework.Bundle;

import br.ufscar.dc.dmasp.controller.DmaspFactory;
import br.ufscar.dc.dmasp.model.Advice;
import br.ufscar.dc.dmasp.model.Aspect;
import br.ufscar.dc.dmasp.model.Association;
import br.ufscar.dc.dmasp.model.Attribute;
import br.ufscar.dc.dmasp.model.Class;
import br.ufscar.dc.dmasp.model.CompositionPointcut;
import br.ufscar.dc.dmasp.model.Concern;
import br.ufscar.dc.dmasp.model.CrossCuttingConcern;
import br.ufscar.dc.dmasp.model.DeclareParents;
import br.ufscar.dc.dmasp.model.Dependency;
import br.ufscar.dc.dmasp.model.ExistingConcern;
import br.ufscar.dc.dmasp.model.IntroductionAttribute;
import br.ufscar.dc.dmasp.model.IntroductionMethod;
import br.ufscar.dc.dmasp.model.Modifier;
import br.ufscar.dc.dmasp.model.Operation;
import br.ufscar.dc.dmasp.model.Operator;
import br.ufscar.dc.dmasp.model.Package;
import br.ufscar.dc.dmasp.model.Parameter;
import br.ufscar.dc.dmasp.model.Pendency;
import br.ufscar.dc.dmasp.model.Pointcut;
import br.ufscar.dc.dmasp.model.Project;
import br.ufscar.dc.dmasp.model.TargetPointcut;
import br.ufscar.dc.dmasp.model.Term;
import br.ufscar.dc.dmasp.model.Type;
import br.ufscar.dc.dmasp.model.Variable;
import br.ufscar.dc.dmasp.views.RefactoringView;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;

import dmasp.exceptions.ProjectNotInitializedException;

public class DmaspController {

	private Project project;
	private String diagramTemplateXSLT;
	private String modelXML;
	private String diagramXMIFile;
	private String packageTemplateXSLT;
	private String packageXMIFile;
	private String judeStandard;
	private String stereotypedModel;
	private String judeProjectName;
	private XStream stream;
	private TransformerFactory transformerFactory;
	private List<CompilationUnit> units;
	private List<Pendency> pendencies;
	private boolean useSameStructure = false;

	public boolean isUseSameStructure() {
		return useSameStructure;
	}

	public void setUseSameStructure(boolean useSameStructure) {
		this.useSameStructure = useSameStructure;
	}

	public DmaspController() {
		this.diagramTemplateXSLT = "";
		this.diagramXMIFile = "";
		this.packageTemplateXSLT = "";
		this.packageXMIFile = "";
		this.modelXML = "";
		this.judeStandard = "";
		this.stereotypedModel = "";
		this.judeProjectName = "";
		this.project = null;
		this.stream = new XStream(new DomDriver());
		this.transformerFactory = TransformerFactory.newInstance();
		this.units = new ArrayList<CompilationUnit>();
		this.pendencies = new ArrayList<Pendency>();
	}

	private void createAliases() {
		stream.alias("project", Project.class);
		stream.alias("association", Association.class);
		stream.alias("dependency", Dependency.class);
		stream.alias("package", Package.class);
		stream.alias("class", Class.class);
		stream.alias("attribute", Attribute.class);
		stream.alias("variable", Variable.class);
		stream.alias("operation", Operation.class);
		stream.alias("parameter", Parameter.class);
		stream.alias("concern", Concern.class);
		stream.alias("modifier", Modifier.class);
		stream.alias("type", Type.class);
		stream.alias("aspect", Aspect.class);
		stream.alias("crosscuttingconcern", CrossCuttingConcern.class);
		stream.alias("pointcut", Pointcut.class);
		stream.alias("advice", Advice.class);
		stream.alias("declareparents", DeclareParents.class);
		stream.alias("compositionpointcut", CompositionPointcut.class);
		stream.alias("term", Term.class);
		stream.alias("pointcut", Operator.class);
		stream.alias("pointcut", TargetPointcut.class);
		stream.alias("introductionAttribute", IntroductionAttribute.class);
		stream.alias("introductionMethod", IntroductionMethod.class);
		stream.alias("existingConcern", ExistingConcern.class);
	}

	private String getInstallLocation() throws Exception {
		Bundle bundle = Platform.getBundle("br.ufscar.dc.dmasp");
		URL locationUrl = FileLocator.find(bundle, new Path("/"), null);
		URL fileUrl = FileLocator.toFileURL(locationUrl);
		return fileUrl.getFile();
	}

	public void initializeProject() throws ProjectNotInitializedException {
		this.project = (DmaspFactory.getInstance()).getProject();

		if (project == null) {
			throw new ProjectNotInitializedException("Project not initialized.");
		}
		String projectLocation = project.getPath();

		try {
			String sLocation = getInstallLocation();
			sLocation = sLocation + "/dmasp/";
			String XMIDirectory = projectLocation + "/xmi/";
			String JudeDirectory = projectLocation + "/jude/";			
			
			// Create xmi directory in project begin
			File fF = new File(XMIDirectory);
			fF.mkdir();
			// Create xmi directory in project end

			// Create Jude directory in project begin
			fF = new File(JudeDirectory);
			fF.mkdir();
			// Create Jude directory in project end

			this.judeProjectName = JudeDirectory + "stereotypedModel.jude";
			this.modelXML = XMIDirectory + "XMLModel.xml";
			this.stereotypedModel = XMIDirectory + "stereotypedModel.xmi";

			this.diagramTemplateXSLT = sLocation
					+ "diagram-template-xslt-jude.xsl";
			this.diagramXMIFile = sLocation + "diagramXMIFileJude.xmi";
			this.packageTemplateXSLT = sLocation
					+ "package-template-xslt-jude.xsl";
			this.packageXMIFile = sLocation + "packageXMIFileJude.xmi";
			this.judeStandard = sLocation + "judeStandard.xmi";

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}

	}
	
	private String mvcaseTypesTemplate = "";
	private String mvcaseLabelTemplate = "";
	private String mvcaseTypesFile = "";
	private String mvcaseLabelFile = "";
	private String mvcaseModelFile = "";
	private String mvcaseDiagramFile = "";
	private String mvcaseModelTemplate = "";
	private String mvcaseDiagramTemplate = "";
	
	public void initializeProjectMVCASE() throws ProjectNotInitializedException {
		this.project = (DmaspFactory.getInstance()).getProject();

		if (project == null) {
			throw new ProjectNotInitializedException("Project not initialized.");
		}
		String projectLocation = project.getPath();		
		
		try {
			String sLocation = getInstallLocation();
			String MVCASEDirectory = projectLocation + "/mvcase/";
			sLocation = sLocation + "/dmasp/";
		
			mvcaseTypesTemplate = sLocation + "JavaTypes.xml";
			mvcaseLabelTemplate = sLocation + "JavaLabel.xml";;

			Bundle bundle = Platform.getBundle("br.ufscar.dc.mvcase.diagram.def");
			URL locationUrl = FileLocator.find(bundle, new Path("/"), null);
			URL fileUrl = FileLocator.toFileURL(locationUrl);
			
			mvcaseTypesFile = fileUrl.getFile() + "/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml";
			mvcaseLabelFile = fileUrl.getFile() + "/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.properties";
			
			
			// Create MVCASE directory in project begin
			File fF = new File(MVCASEDirectory);
			fF.mkdir();
			// Create MVCASE directory in project end

			mvcaseModelFile = MVCASEDirectory + project.getName() + ".uml";
			modelXML = MVCASEDirectory + "XMLModel.xml";	
			mvcaseDiagramFile = MVCASEDirectory + project.getName() + ".uml_class_diagram";
			mvcaseModelTemplate = sLocation + "modeloOA_MVCase.xml";
			mvcaseDiagramTemplate = sLocation + "diagrama.xml";
			
		} catch (Exception ex) {			
			System.out.println(ex.getMessage());
		}
	}

	/*public void initializeProjectHTML() throws ProjectNotInitializedException {
		this.project = (DmaspFactory.getInstance()).getProject();

		if (project == null) {
			throw new ProjectNotInitializedException("Project not initialized.");
		}
		String projectLocation = project.getPath();		
		
		try {
			String sLocation = getInstallLocation();
			sLocation = sLocation + "/dmasp/";
			String XMIDirectory = projectLocation + "/xmi/";

			Bundle bundle = Platform.getBundle("br.ufscar.dc.mvcase.diagram.def");
			URL locationUrl = FileLocator.find(bundle, new Path("/"), null);
			URL fileUrl = FileLocator.toFileURL(locationUrl);
			String teste = fileUrl.getFile() + "/teste/";
			
			System.err.println("aquiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
			
			File fFF = new File(teste);
			fFF.mkdir();
			
			
			// Create xmi directory in project begin
			File fF = new File(XMIDirectory);
			fF.mkdir();
			// Create xmi directory in project end

			this.modelXML = XMIDirectory + "XMLModel.xml";
			this.stereotypedModel = XMIDirectory + "stereotypedModel.html";
			this.diagramTemplateXSLT = sLocation + "template-xslt-HTML.xsl";
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}

	}*/

	public RefactoringView getRefactoringView() {
		try {
			RefactoringView view = (RefactoringView) PlatformUI.getWorkbench()
					.getActiveWorkbenchWindow().getActivePage()
					.showView("br.ufscar.dc.dmasp.views.RefactoringView");
			return view;
		} catch (PartInitException e) {
			return null;
		}
	}

	public String refLogging(String aspectName, String loggingStereotypeName,
			String entryLoggingMethodName, String exitLoggingMethodName) {
		// No aspecto, o ID é igual ao seu proprio nome.

		Aspect as = project.findAspectById(aspectName);
		if (as == null)
			return "Aspect name not found.";

		String refLogging = "Logging";
		RefactoringView view = getRefactoringView();
		if (view != null)
			view.addItem(refLogging);

		
		// Diferencia o nome do aspecto abstrato dos subaspectos.
		as.setName("A"+ as.getName());
		as.setId("A"+ as.getId());
		aspectName = "A" + aspectName;
		
		as.setAbstract(true);
		if (view != null)
			view.addSubItem(refLogging, "The aspect \"" + as.getName()
					+ "\"  was converted in abstract one.");

		Pointcut entryAbstract = new Pointcut(aspectName + ".entryLog",
				"entryLog", new Type("Call", "Call"), true);
		Pointcut exitAbstract = new Pointcut(aspectName + ".exitLog",
				"exitLog", new Type("Call", "Call"), true);
		if (view != null)
			view.addSubItem(refLogging,
					"The abstract pointcuts \"" + entryAbstract.getName()
							+ "\" and \"" + exitAbstract.getName()
							+ "\" was created in the aspect \"" + as.getName()
							+ "\".");

		Advice adBefore = new Advice("beforeAd" + entryAbstract.getId(),
				"beforeLog", new Type("void", "void"), Advice.beforeType);
		Advice adAfter = new Advice("afterAd" + exitAbstract.getId(),
				"afterLog", new Type("void", "void"), Advice.afterType);
		if (view != null) {
			view.addSubItem(refLogging, "The advice \"" + adBefore.getName()
					+ "\" was created and associated to the pointcut \""
					+ entryAbstract.getName() + "\".");
			view.addSubItem(refLogging, "The advice \"" + adAfter.getName()
					+ "\" was created and associated to the pointcut \""
					+ exitAbstract.getName() + "\".");
		}

		adBefore.setPointcut(entryAbstract);
		adAfter.setPointcut(exitAbstract);

		as.addPointcut(entryAbstract);
		as.addPointcut(exitAbstract);
		as.addAdvice(adBefore);
		as.addAdvice(adAfter);

		CrossCuttingConcern cc = project
				.findCrossCuttingConcernByAspectId(aspectName);
		Aspect newAs = new Aspect("LoggingAspect", "LoggingAspect");
		if (view != null)
			view.addSubItem(refLogging, "The aspect \"" + newAs.getName()
					+ "\"  was created. It is an extension of the aspect \""
					+ as.getName() + "\"");

		Pointcut entryNonAbstract = new Pointcut(entryAbstract);
		Pointcut exitNonAbstract = new Pointcut(exitAbstract);
		entryNonAbstract.setAbstract(false);
		exitNonAbstract.setAbstract(false);
		if (view != null)
			view.addSubItem(
					refLogging,
					"The pointcuts \"" + entryNonAbstract.getName()
							+ "\" and \"" + exitNonAbstract.getName()
							+ "\" was created in the aspect \""
							+ newAs.getName()
							+ "\". They overridden the abstract pointcuts \""
							+ entryAbstract.getName() + "\" and \""
							+ exitAbstract.getName() + "\".");

		List<Class> lsClasses = project
				.getClassesWithStereotypeId(loggingStereotypeName);
		Iterator<Class> itClasses = lsClasses.iterator();
		while (itClasses.hasNext()) {
			Class cl = itClasses.next();

			List<Operation> lsOperation = new ArrayList<Operation>(
					cl.getOperations());
			Iterator<Operation> itOperations = lsOperation.iterator();
			while (itOperations.hasNext()) {
				Operation op = itOperations.next();
				if (op.findConcernByName("Sec_" + loggingStereotypeName) != null) {
					if (op.isCalledOperationExist(entryLoggingMethodName)) {
						Operation op1 = new Operation(op);
						entryNonAbstract.addOperation(op1);
						if (view != null)
							view.addSubItem(
									refLogging,
									"The operation \""
											+ op.getName()
											+ "\" was associated to the pointcut \""
											+ entryNonAbstract.getName()
											+ "\".");
					}

					if (op.isCalledOperationExist(exitLoggingMethodName)) {
						Operation op1 = new Operation(op);
						exitNonAbstract.addOperation(op1);
						if (view != null)
							view.addSubItem(
									refLogging,
									"The operation \""
											+ op.getName()
											+ "\" was associated to the pointcut \""
											+ exitNonAbstract.getName() + "\".");
					}
					op.removeConcernById(loggingStereotypeName);
				}
			}
			cl.removeConcernById(loggingStereotypeName);
		}

		if (entryNonAbstract.getOperations().size() > 0)
			newAs.addPointcut(entryNonAbstract);
		if (exitNonAbstract.getOperations().size() > 0)
			newAs.addPointcut(exitNonAbstract);

		// Cria herança
		newAs.setInherit(new Aspect(as));

		cc.addAspect(newAs);

		return null;
	}

	public String refObserver(String aspectName, String observerStereotypeName,
			String notifyObserverMethodName, String observerType,
			String subjectType) {
		// No aspecto, o ID é igual ao seu proprio nome.
		Aspect as = project.findAspectById(aspectName);
		if (as == null)
			return "Aspect name not found.";

		String refObserver = "Observer";
		RefactoringView view = getRefactoringView();
		if (view != null)
			view.addItem(refObserver);

		Pointcut notifyObserversPC = new Pointcut(aspectName + ".changed",
				"changed", new Type("Call", "Call"), false);
		if (view != null)
			view.addSubItem(refObserver,
					"The pointcut \"" + notifyObserversPC.getName()
							+ "\" was created in the aspect \"" + as.getName()
							+ "\".");

		TargetPointcut targetPC = new TargetPointcut(aspectName + ".target",
				"target", new Type("Target", "Target"), false);

		Advice adAfter = new Advice("afterAd" + notifyObserversPC.getId(),
				"afterChanging", new Type("void", "void"), Advice.afterType);
		if (view != null)
			view.addSubItem(refObserver, "The advice \"" + adAfter.getName()
					+ "\" was created and associated to the pointcut \""
					+ notifyObserversPC.getName() + "\".");

		List<Class> lsClasses = project
				.getClassesWithStereotypeId(observerStereotypeName);
		Iterator<Class> itClasses = lsClasses.iterator();
		while (itClasses.hasNext()) {
			Class cl = itClasses.next();
			Class clToBeRefact = null;
			if (cl.isSubtypeOf(observerType)) {
				clToBeRefact = project.findClassByName(observerType);
			} else if (cl.isSubtypeOf(subjectType)) {
				clToBeRefact = project.findClassByName(subjectType);
			}
			if (clToBeRefact != null) {
				String dpId = as.getId() + "." + cl.getId() + "."
						+ clToBeRefact.getId();
				DeclareParents dp = as.findDeclareParentsById(dpId);
				if (dp == null) {
					dp = new DeclareParents(dpId, DeclareParents.implementsType);
					dp.setClBase(new Class(cl));
					dp.addSonClass(new Class(clToBeRefact));
					cl.removeSuper(clToBeRefact.getId());
					as.addDeclareParents(dp);
					if (view != null)
						view.addSubItem(refObserver,
								"The interface \"" + clToBeRefact.getName()
										+ "\" was implemented by the class \""
										+ cl.getName() + "\".");
				}
			}

			List<Operation> lsOperation = new ArrayList<Operation>(
					cl.getOperations());
			Iterator<Operation> itOperations = lsOperation.iterator();
			while (itOperations.hasNext()) {
				Operation op = itOperations.next();
				if (op.findConcernByName("Sec_" + observerStereotypeName) != null) {
					op.removeConcernById(observerStereotypeName);

					if (op.isCalledOperationExist(notifyObserverMethodName)) {
						Operation op1 = new Operation(op);
						notifyObserversPC.addOperation(op1);
						targetPC.addTarget(new Class(cl));
						if (view != null)
							view.addSubItem(refObserver, "The operation \""
									+ op.getName()
									+ "\" was associated to the pointcut \""
									+ notifyObserversPC.getName() + "\".");
					}
				}
			}
			cl.removeConcernById(observerStereotypeName);
		}

		if (notifyObserversPC.getOperations().size() > 0) {
			CompositionPointcut compositeTarget = new CompositionPointcut(
					aspectName + ".compositeTarget", "compositeTarget",
					new Type("Call", "Call"), false);
			compositeTarget.addTerm(new Pointcut(notifyObserversPC));
			compositeTarget.addTerm(new Operator(Operator.andCond));
			compositeTarget.addTerm(new TargetPointcut(targetPC));

			adAfter.setPointcut(compositeTarget);

			as.addPointcut(notifyObserversPC);
			as.addPointcut(targetPC);
			as.addPointcut(compositeTarget);
			as.addAdvice(adAfter);
		}

		return null;
	}

	public String refSingleon(String aspectName, String stereotypeName,
			String singletonClass) {
		// No aspecto, o ID é igual ao seu proprio nome.
		Aspect as = project.findAspectById(aspectName);
		if (as == null)
			return "Aspect name not found.";

		String refSingleton = "Singleton";
		RefactoringView view = getRefactoringView();
		if (view != null)
			view.addItem(refSingleton);

		Class clAux = project.findClassByName(singletonClass);

		Pointcut getInstancePC = new Pointcut(aspectName + ".getInstance",
				"getInstance", new Type("Call", "Call"), false);
		if (view != null)
			view.addSubItem(refSingleton,
					"The pointcut \"" + getInstancePC.getName()
							+ "\" was created in the aspect \"" + as.getName()
							+ "\".");

		Advice adAround = new Advice("aroundAd" + getInstancePC.getId(),
				"aroundGetInstance", new Type(clAux), Advice.aroundType);
		if (view != null)
			view.addSubItem(refSingleton, "The advice \"" + adAround.getName()
					+ "\" was created and associated to the pointcut \""
					+ getInstancePC.getName() + "\".");

		adAround.setPointcut(getInstancePC);

		List<Operation> lsOpAux = new ArrayList<Operation>(
				clAux.getOperations());
		Iterator<Operation> itOp = lsOpAux.iterator();
		while (itOp.hasNext()) {
			Operation op = itOp.next();
			Concern cnOp = op.findConcernByName("Pri_" + stereotypeName);
			if ((cnOp != null) && (op.getConcerns().size() == 1)) {
				Operation newOp = new Operation(op);
				newOp.removeAllConcerns();
				Operation opAux = as.findOperationById(op.getId());
				if (view != null)
					view.addSubItem(
							refSingleton,
							"The operation \"" + newOp.getName()
									+ "\" was moved to the aspect \""
									+ as.getName()
									+ "\", because it totally represents a \""
									+ stereotypeName + "\" concern.");

				if (opAux == null) {
					as.addOperation(newOp);
				}
				clAux.removeOperationById(op.getId());
			}
		}

		List<Operation> lsOperations = project
				.getOperationsWithStereotypeId(stereotypeName);
		Iterator<Operation> it = lsOperations.iterator();

		while (it.hasNext()) {
			Operation op = it.next();
			op.removeConcernById(stereotypeName);
			Operation op1 = new Operation(op);
			getInstancePC.addOperation(op1);
			if (view != null)
				view.addSubItem(refSingleton, "The operation \"" + op.getName()
						+ "\" was associated to the pointcuts \""
						+ getInstancePC.getName() + "\".");
		}

		List<Class> lsClasses = project
				.getClassesWithStereotypeId(stereotypeName);
		Iterator<Class> itC = lsClasses.iterator();
		while (itC.hasNext()) {
			Class cl = itC.next();
			cl.removeConcernById(stereotypeName);
		}

		as.addPointcut(getInstancePC);
		as.addAdvice(adAround);

		return null;
	}

	public String refConnection(String aspectName, String connStereotypeName,
			String openConnMethodName, String closeConnMethodName) {
		// No aspecto, o ID é igual ao seu proprio nome.
		Aspect as = project.findAspectById(aspectName);
		if (as == null)
			return "Aspect name not found.";

		String refConnection = "Connection";
		RefactoringView view = getRefactoringView();
		if (view != null)
			view.addItem(refConnection);

		// Diferencia o nome do aspecto abstrato dos subaspectos.
		as.setName("A"+ as.getName());
		as.setId("A"+ as.getId());
		aspectName = "A" + aspectName;
		
		as.setAbstract(true);
		if (view != null)
			view.addSubItem(refConnection, "The aspect \"" + as.getName()
					+ "\"  was converted in abstract one.");

		Pointcut openConnAbstract = new Pointcut(
				aspectName + ".openConnection", "openConnection", new Type(
						"Call", "Call"), true);
		Pointcut closeConnAbstract = new Pointcut(aspectName
				+ ".closeConnection", "closeConnection", new Type("Call",
				"Call"), true);
		if (view != null)
			view.addSubItem(refConnection, "The abstract pointcuts \""
					+ openConnAbstract.getName() + "\" and \""
					+ closeConnAbstract.getName()
					+ "\" was created in the aspect \"" + as.getName() + "\".");

		Advice adBefore = new Advice("beforeAd" + openConnAbstract.getId(),
				"beforeConnection", new Type("void", "void"), Advice.beforeType);
		Advice adAfter = new Advice("afterAd" + openConnAbstract.getId(),
				"afterConnection", new Type("void", "void"), Advice.afterType);
		if (view != null) {
			view.addSubItem(refConnection, "The advice \"" + adBefore.getName()
					+ "\" was created and associated to the pointcut \""
					+ openConnAbstract.getName() + "\".");
			view.addSubItem(refConnection, "The advice \"" + adAfter.getName()
					+ "\" was created and associated to the pointcut \""
					+ closeConnAbstract.getName() + "\".");
		}

		adBefore.setPointcut(openConnAbstract);
		adAfter.setPointcut(closeConnAbstract);

		as.addPointcut(openConnAbstract);
		as.addPointcut(closeConnAbstract);
		as.addAdvice(adBefore);
		as.addAdvice(adAfter);

		CrossCuttingConcern cc = project
				.findCrossCuttingConcernByAspectId(aspectName);
		Aspect newAs = new Aspect("ConnectionManagerAspect",
				"ConnectionManagerAspect");
		if (view != null)
			view.addSubItem(refConnection, "The aspect \"" + newAs.getName()
					+ "\"  was created. It is an extension of the aspect \""
					+ as.getName() + "\"");

		Pointcut openConnNonAbstract = new Pointcut(openConnAbstract);
		Pointcut closeConnNonAbstract = new Pointcut(closeConnAbstract);
		if (view != null)
			view.addSubItem(refConnection, "The pointcuts \""
					+ openConnNonAbstract.getName() + "\" and \""
					+ closeConnNonAbstract.getName()
					+ "\" was created in the aspect \"" + newAs.getName()
					+ "\". They overridden the abstract pointcuts \""
					+ openConnAbstract.getName() + "\" and \""
					+ closeConnAbstract.getName() + "\".");

		openConnNonAbstract.setAbstract(false);
		closeConnNonAbstract.setAbstract(false);

		List<Class> lsClasses = project
				.getClassesWithStereotypeId(connStereotypeName);
		Iterator<Class> itClasses = lsClasses.iterator();
		while (itClasses.hasNext()) {
			Class cl = itClasses.next();

			List<Operation> lsOperation = new ArrayList<Operation>(
					cl.getOperations());
			Iterator<Operation> itOperations = lsOperation.iterator();
			while (itOperations.hasNext()) {
				Operation op = itOperations.next();
				if (op.findConcernByName("Sec_" + connStereotypeName) != null) {
					op.removeConcernById(connStereotypeName);

					if (op.isCalledOperationExist(openConnMethodName)) {
						Operation op1 = new Operation(op);
						openConnNonAbstract.addOperation(op1);
						if (view != null)
							view.addSubItem(refConnection, "The operation \""
									+ op.getName()
									+ "\" was associated to the pointcut \""
									+ openConnNonAbstract.getName() + "\".");
					}
					if (op.isCalledOperationExist(closeConnMethodName)) {
						Operation op1 = new Operation(op);
						closeConnNonAbstract.addOperation(op1);
						if (view != null)
							view.addSubItem(refConnection, "The operation \""
									+ op.getName()
									+ "\" was associated to the pointcut \""
									+ closeConnNonAbstract.getName() + "\".");
					}
				}
			}
			cl.removeConcernById(connStereotypeName);
		}

		if (openConnNonAbstract.getOperations().size() > 0)
			newAs.addPointcut(openConnNonAbstract);
		if (closeConnNonAbstract.getOperations().size() > 0)
			newAs.addPointcut(closeConnNonAbstract);

		// Cria herança
		newAs.setInherit(new Aspect(as));

		cc.addAspect(newAs);

		return null;
	}

	public String refTransaction(String aspectName, String stereotypeName) {
		// No aspecto, o ID é igual ao seu proprio nome.
		Aspect as = project.findAspectById(aspectName);
		if (as == null)
			return "Aspect name not found.";

		String refTransaction = "Transaction";
		RefactoringView view = getRefactoringView();
		if (view != null)
			view.addItem(refTransaction);

		// Diferencia o nome do aspecto abstrato dos subaspectos.
		as.setName("A"+ as.getName());
		as.setId("A"+ as.getId());
		aspectName = "A" + aspectName;
		
		as.setAbstract(true);
		if (view != null)
			view.addSubItem(refTransaction, "The aspect \"" + as.getName()
					+ "\"  was converted in abstract one.");

		Pointcut transactionalAbstract = new Pointcut(aspectName
				+ ".transactionalMethods", "transactionalMethods", new Type(
				"Call", "Call"), true);
		if (view != null)
			view.addSubItem(refTransaction, "The abstract pointcut \""
					+ transactionalAbstract.getName()
					+ "\" was created in the aspect \"" + as.getName() + "\".");

		Advice adAround = new Advice(
				"aroundAd" + transactionalAbstract.getId(), "aroundConnection",
				new Type("void", "void"), Advice.aroundType);
		if (view != null)
			view.addSubItem(
					refTransaction,
					"The advice \""
							+ adAround.getName()
							+ "\" was created and associated to the pointcut \""
							+ transactionalAbstract.getName() + "\".");

		adAround.setPointcut(transactionalAbstract);

		as.addPointcut(transactionalAbstract);
		as.addAdvice(adAround);

		CrossCuttingConcern cc = project
				.findCrossCuttingConcernByAspectId(aspectName);
		Aspect newAs = new Aspect("TransactionManagerAspect",
				"TransactionManagerAspect");
		if (view != null)
			view.addSubItem(refTransaction, "The aspect \"" + newAs.getName()
					+ "\"  was created. It is an extension of the aspect \""
					+ as.getName() + "\"");

		Pointcut transactionalNonAbstract = new Pointcut(transactionalAbstract);
		if (view != null)
			view.addSubItem(refTransaction, "The pointcut \""
					+ transactionalNonAbstract.getName()
					+ "\" was created in the aspect \"" + newAs.getName()
					+ "\". They overridden the abstract pointcut \""
					+ transactionalAbstract.getName() + "\".");

		transactionalNonAbstract.setAbstract(false);

		List<Operation> lsOperations = project
				.getOperationsWithStereotypeId(stereotypeName);
		Iterator<Operation> it = lsOperations.iterator();

		while (it.hasNext()) {
			Operation op = it.next();
			System.out.println("tttttttttt: =" + stereotypeName);
			op.removeConcernById(stereotypeName);
			Operation opAux = new Operation(op);
			transactionalNonAbstract.addOperation(opAux);
			if (view != null)
				view.addSubItem(refTransaction,
						"The operation \"" + op.getName()
								+ "\" was associated to the pointcut \""
								+ transactionalNonAbstract.getName() + "\".");
		}

		List<Class> lsClasses = project
				.getClassesWithStereotypeId(stereotypeName);
		Iterator<Class> itC = lsClasses.iterator();
		while (itC.hasNext()) {
			Class cl = itC.next();
			cl.removeConcernById(stereotypeName);
		}

		newAs.addPointcut(transactionalNonAbstract);

		// Cria herança
		newAs.setInherit(new Aspect(as));

		cc.addAspect(newAs);

		return null;
	}

	public String refSynchronization(String aspectName,
			String synStereotypeName, String perStereotypeName) {
		// No aspecto, o ID é igual ao seu proprio nome.
		Aspect as = project.findAspectById(aspectName);
		if (as == null)
			return "Aspect name not found.";

		String refSyn = "Synchronization";
		RefactoringView view = getRefactoringView();
		if (view != null)
			view.addItem(refSyn);

		
		// Diferencia o nome do aspecto abstrato dos subaspectos.
		as.setName("A"+ as.getName());
		as.setId("A"+ as.getId());
		aspectName = "A" + aspectName;
		as.setAbstract(true);
		if (view != null)
			view.addSubItem(refSyn, "The aspect \"" + as.getName()
					+ "\"  was converted in abstract one.");

		Class newInterface = new Class(as.getId() + ".Persistent", "Persistent");

		String parameterId = as.getId() + "." + newInterface.getId() + "."
				+ newInterface.getName().toLowerCase();
		String parameterName = newInterface.getName().toLowerCase();
		Parameter p = new Parameter(parameterId, parameterName, new Type(
				newInterface));
		Parameter p1 = new Parameter(parameterId, parameterName, new Type(
				newInterface));

		CrossCuttingConcern cc = project.findCrossCuttingConcernByAspectId(as
				.getId());
		if (cc != null) {
			cc.addClass(new Class(newInterface));
			if (view != null)
				view.addSubItem(
						refSyn,
						"The interface \"" + newInterface.getName()
								+ "\" in the crosscutting concern \""
								+ cc.getName() + "\". ");
		}

		List<Class> lsClasses = project
				.getClassesWithStereotypeId(perStereotypeName);
		if (lsClasses != null) {
			Iterator<Class> itClasses = lsClasses.iterator();
			while (itClasses.hasNext()) {
				Class cl = itClasses.next();
				String dpId = as.getId() + "." + cl.getId() + "."
						+ newInterface.getId();
				DeclareParents dp = new DeclareParents(dpId,
						DeclareParents.implementsType);
				dp.setClBase(new Class(cl));
				dp.addSonClass(new Class(newInterface));
				as.addDeclareParents(dp);
				cl.removeConcernById(perStereotypeName);
				if (view != null)
					view.addSubItem(
							refSyn,
							"The interface \"" + newInterface.getName()
									+ "\"  was realized by the class \""
									+ as.getName() + "\".");
			}
		}

		TargetPointcut targetPC = new TargetPointcut(aspectName
				+ ".targetPersistent", "targetPersistent", new Type("Target",
				"Target"), false);
		if (view != null)
			view.addSubItem(refSyn,
					"The target pointcut \"" + targetPC.getName()
							+ "\" was created in the aspect \"" + as.getName()
							+ "\". It captures objects of the type \""
							+ newInterface.getName() + "\".");

		targetPC.addTarget(new Class(newInterface));

		Pointcut insertPC = new Pointcut(aspectName + ".insert", "insert",
				new Type("Call", "Call"), true);
		Pointcut updatePC = new Pointcut(aspectName + ".update", "update",
				new Type("Call", "Call"), true);
		if (view != null)
			view.addSubItem(refSyn,
					"The abstract pointcuts \"" + insertPC.getName()
							+ "\" and \"" + updatePC.getName()
							+ "\" was created in the aspect \"" + as.getName()
							+ "\".");

		insertPC.addParameter(p);
		updatePC.addParameter(p1);

		CompositionPointcut compositeInsertTarget = new CompositionPointcut(
				aspectName + ".compositeInsertTarget", "compositeInsertTarget",
				new Type("Call", "Call"), false);
		if (view != null)
			view.addSubItem(refSyn, "The composite pointcut \""
					+ compositeInsertTarget.getName()
					+ "\" was created in the aspect \"" + as.getName() + "\".");
		compositeInsertTarget.addTerm(new Pointcut(insertPC));
		compositeInsertTarget.addTerm(new Operator(Operator.andCond));
		compositeInsertTarget.addTerm(new TargetPointcut(targetPC));

		CompositionPointcut compositeUpdateTarget = new CompositionPointcut(
				aspectName + ".compositeUpdateTarget", "compositeUpdateTarget",
				new Type("Call", "Call"), false);
		if (view != null)
			view.addSubItem(refSyn, "The composite pointcut \""
					+ compositeUpdateTarget.getName()
					+ "\" was created in the aspect \"" + as.getName() + "\".");
		compositeUpdateTarget.addTerm(new Pointcut(updatePC));
		compositeUpdateTarget.addTerm(new Operator(Operator.andCond));
		compositeUpdateTarget.addTerm(new TargetPointcut(targetPC));

		Advice adAfterInsert = new Advice("afterInsertAd" + insertPC.getId(),
				"afterInsert", new Type("void", "void"), Advice.afterType);
		Advice adAfterUpdate = new Advice("afterUpdateAd" + updatePC.getId(),
				"afterUpdate", new Type("void", "void"), Advice.afterType);
		if (view != null) {
			view.addSubItem(refSyn, "The advice \"" + adAfterInsert.getName()
					+ "\" was created and associated to the pointcut \""
					+ compositeInsertTarget.getName() + "\".");
			view.addSubItem(refSyn, "The advice \"" + adAfterUpdate.getName()
					+ "\" was created and associated to the pointcut \""
					+ compositeUpdateTarget.getName() + "\".");
		}

		adAfterInsert.setPointcut(compositeInsertTarget);
		adAfterUpdate.setPointcut(compositeUpdateTarget);

		as.addPointcut(targetPC);
		as.addPointcut(insertPC);
		as.addPointcut(updatePC);
		as.addPointcut(compositeInsertTarget);
		as.addPointcut(compositeUpdateTarget);
		as.addAdvice(adAfterInsert);
		as.addAdvice(adAfterUpdate);

		List<Class> lsClassesSyn = project
				.getClassesWithStereotypeId(synStereotypeName);
		if (lsClassesSyn != null) {
			Iterator<Class> itClasses = lsClassesSyn.iterator();
			while (itClasses.hasNext()) {
				Class cl = itClasses.next();
				String aspectNameAux = aspectName + cl.getName();
				Aspect asAux = project.findAspectById(aspectNameAux);
				if (asAux == null)
					asAux = new Aspect(aspectNameAux, aspectNameAux);
				if (view != null)
					view.addSubItem(
							refSyn,
							"The aspect \""
									+ asAux.getName()
									+ "\"  was created. It is an extension of the aspect \""
									+ as.getName() + "\"");

				asAux.setInherit(new Aspect(as));

				Pointcut insertNonAbstract = new Pointcut(insertPC);
				Pointcut updateNonAbstract = new Pointcut(updatePC);
				if (view != null)
					view.addSubItem(
							refSyn,
							"The pointcuts \""
									+ insertNonAbstract.getName()
									+ "\" and \""
									+ updateNonAbstract.getName()
									+ "\" was created in the aspect \""
									+ asAux.getName()
									+ "\". They overridden the abstract pointcuts \""
									+ insertPC.getName() + "\" and \""
									+ updatePC.getName() + "\".");

				insertNonAbstract.setAbstract(false);
				updateNonAbstract.setAbstract(false);

				List<Operation> lsOperations = cl.getOperations();
				Iterator<Operation> it = lsOperations.iterator();

				while (it.hasNext()) {
					Operation op = it.next();
					if (op.isConcernExist(synStereotypeName)) {
						op.removeConcernById(synStereotypeName);
						Operation opAux = new Operation(op);
						Operation opAux1 = new Operation(op);
						insertNonAbstract.addOperation(opAux);
						updateNonAbstract.addOperation(opAux1);
						if (view != null)
							view.addSubItem(
									refSyn,
									"The operation \""
											+ op.getName()
											+ "\" was associated to the pointcuts \""
											+ insertNonAbstract.getName()
											+ "\" and \""
											+ updateNonAbstract.getName()
											+ "\".");
					}
				}

				asAux.addPointcut(insertNonAbstract);
				asAux.addPointcut(updateNonAbstract);
				cc.addAspect(asAux);

				cl.removeConcernById(synStereotypeName);
			}
		}

		return null;
	}

	public boolean ref1(String stereotypeName) {
		String priStereotype = "";
		boolean isItOk = false;

		String ref1Id = "Ref1";
		RefactoringView view = getRefactoringView();

		if (view != null)
			view.addItem(ref1Id);

		if (project.getClasses() != null) {
			List<Class> lsClasses = new ArrayList<Class>(project.getClasses());
			Iterator<Class> itClasses = lsClasses.iterator();
			Concern cn = null;
			Class clToBeRefact = null;
			while (itClasses.hasNext()) {
				clToBeRefact = itClasses.next();
				List<Concern> lstConcerns = clToBeRefact
						.findConcernWhoseNameStartsWith("Pri_" + stereotypeName);
				if (lstConcerns.size() > 0) {
					Iterator<Concern> itConcerns = lstConcerns.iterator();
					while (itConcerns.hasNext()) {
						cn = itConcerns.next();
						priStereotype = cn.getId();

						if (analyseref1().contains(priStereotype)) {

							String aspectName = priStereotype + "Aspect";
							Concern primaryConcern = null;

							boolean useCC = false;
							boolean useAspect = false;
							boolean createdCC = false;
							boolean createdAs = false;
							CrossCuttingConcern cc = null;
							Aspect as = null;

							List<Class> classes = new ArrayList<Class>(
									project.getClasses());
							Iterator<Class> newItClasses = classes.iterator();
							newItClasses = classes.iterator();

							while (newItClasses.hasNext()) {
								Class cl = newItClasses.next();
								primaryConcern = cl.findConcernByName("Sec_"
										+ priStereotype);
								if (((primaryConcern != null) && (!cl
										.hasOverridedMethods(clToBeRefact)))) {

									isItOk = true;
									if (!createdCC) {
										cc = project
												.findCrossCuttingConcernByName(priStereotype);
										if (cc == null) {
											useCC = false;
											cc = new CrossCuttingConcern(
													priStereotype);
											if (view != null)
												view.addSubItem(
														ref1Id,
														"The crosscutting concern \""
																+ cc.getName()
																+ "\" has been created.");

										} else {
											useCC = true;
										}
										createdCC = true;
									}

									if (!createdAs) {
										as = project.findAspectById(aspectName);
										if (as == null) {
											useAspect = false;
											as = new Aspect(aspectName,
													aspectName);
											if (view != null)
												view.addSubItem(
														ref1Id,
														"The aspect \""
																+ as.getName()
																+ "\" has been created.");
										} else
											useAspect = true;
										createdAs = true;
									}

									// Add the class if it has an only one
									// concern.
									if ((clToBeRefact.countConcerns() == 1)
											&& (cc.findClassById(clToBeRefact
													.getId()) == null)) {
										Class clAux = new Class(clToBeRefact);
										clAux.clearConcerns();
										cc.addClass(clAux);
										project.removeClassById(clToBeRefact
												.getId());
										if (view != null)
											view.addSubItem(
													ref1Id,
													"The class \""
															+ clAux.getName()
															+ "\" has been moved to the crosscutting concern \""
															+ cc.getName()
															+ "\", because it totally represents a \""
															+ priStereotype
															+ "\" concern.");
									}

									// Add the attributes totally affected.
									List<Attribute> lsAux = new ArrayList<Attribute>(
											cl.getAttributes());
									Iterator<Attribute> itAttr = lsAux
											.iterator();
									while (itAttr.hasNext()) {
										Attribute attr = itAttr.next();
										Concern cnAttr = attr
												.findConcernByName("Pri_"
														+ priStereotype);
										if ((cnAttr != null)
												&& (attr.getConcerns().size() == 1)) {
											Attribute newAttr = new Attribute(
													attr);
											newAttr.removeAllConcerns();
											Attribute attrAux = as
													.findAttributeByName(attr
															.getName());
											if (attrAux == null) {
												as.addAttribute(newAttr);
											}
											cl.removeAttributeById(attr);
											cl.updateListOfConcerns(false);
											project.removeAssociationByClassId(
													attr.getType().getId(),
													cl.getId());
											if (view != null)
												view.addSubItem(
														ref1Id,
														"The attribute \""
																+ newAttr
																		.getName()
																+ "\" has been moved to the aspect \""
																+ as.getName()
																+ "\", because it totally represents a \""
																+ priStereotype
																+ "\" concern.");
										}
									}

									// Add the operations totally affected.
									List<Operation> lsOpAux = new ArrayList<Operation>(
											cl.getOperations());
									Iterator<Operation> itOp = lsOpAux
											.iterator();
									while (itOp.hasNext()) {
										boolean createdIntroductionMethod = false;
										boolean useIntroductionMethod = false;
										IntroductionMethod im = null;
										Operation op = itOp.next();
										Concern cnOp = op
												.findConcernByName("Pri_"
														+ priStereotype);
										if ((cnOp != null)
												&& (op.getConcerns().size() == 1)
												&& (!cl.isOverrided(op))) {
											Operation newOp = new Operation(op);
											newOp.removeAllConcerns();

											if (!createdIntroductionMethod) {
												im = as.findPointcutById(aspectName
														+ "." + op.getId());
												if (im == null) {
													im = new IntroductionMethod(
															aspectName
																	+ "."
																	+ op.getId(),
															op.getName(),
															new Type(
																	op.getReturnType()),
															false);
												} else {
													useIntroductionMethod = true;
												}
												createdIntroductionMethod = true;
											}

											im.addParameters(new ArrayList<Parameter>(
													op.getParameters()));
											im.addTarget(new Class(cl));

											if (!useIntroductionMethod) {
												as.addPointcut(im);
											}

											if (view != null)
												view.addSubItem(
														ref1Id,
														"The operation \""
																+ op.getName()
																+ "\" has been introduced in the class \""
																+ cl.getName()
																+ "\" by the aspect \""
																+ as.getName()
																+ "\".");

											cl.removeOperationById(op.getId());
											cl.updateListOfConcerns(false);
											if (view != null)
												view.addSubItem(
														ref1Id,
														"The operation \""
																+ newOp.getName()
																+ "\" has been moved to the aspect \""
																+ as.getName()
																+ "\", because it totally represents a \""
																+ priStereotype
																+ "\" concern.");
										}
									}
								}
							}
							if (!useAspect) {
								cc.addAspect(as);
							}
							if (!useCC) {
								project.addCrossCuttingConcern(cc);
							}
						}
					}
				}
			}
		}
		return isItOk;
	}

	public boolean refExample() {
		if (project.getClasses() != null) {
			Class cl = null;
			CrossCuttingConcern cc = null;
			Aspect aspect = null;
			Pointcut pcAffectedMethods = null;

			// 1. Captura a classe “cl” cujo interesse “ConcernX” é primário.
			List<Class> lsClasses = project
					.getClassesWithStereotypeId("Pri_ConcernX");
			if (lsClasses.size() == 1) {
				cl = lsClasses.get(0);

				// 2. Criar um interesse denominado “ConcernX”.
				cc = new CrossCuttingConcern("ConcernX");

				// 3. Criar um aspecto denominado “clAspect”.
				String aspectName = cl.getName() + "Aspect";
				aspect = new Aspect(aspectName, aspectName);

				// 4. Cria um conjunto de junção chamado “affectedMethods”.
				pcAffectedMethods = new Pointcut("affectedMethods",
						"affectedMethods", new Type("CallPointCut",
								"CallPointCut"));
			} else
				return false;

			lsClasses = new ArrayList<Class>(project.getClasses());
			Iterator<Class> itClasses = lsClasses.iterator();
			while (itClasses.hasNext()) {
				Class clAux = itClasses.next();

				// 5. Para cada classe “clAux” cujo interesse secundário seja
				// “ConcernX”.
				if (clAux.isConcernExist("Sec_ConcernX")) {
					List<Attribute> lsAttribute = new ArrayList<Attribute>(
							clAux.getAttributes());
					Iterator<Attribute> itAttribute = lsAttribute.iterator();
					while (itAttribute.hasNext()) {
						Attribute clAttr = itAttribute.next();

						// 5.1. Remove a referência à classe “cl” da classe
						// “clAux”.
						if (clAttr.getType().getId()
								.equalsIgnoreCase(cl.getId())) {
							clAux.removeAttributeById(clAttr);
						}
					}

					List<Operation> lsOperation = new ArrayList<Operation>(
							clAux.getOperations());
					Iterator<Operation> itOperation = lsOperation.iterator();
					while (itOperation.hasNext()) {
						Operation mAux = itOperation.next();

						// 5.2. Para cada método “mAux” que possui chamada ao
						// método “method1”
						if (mAux.isConcernExist("Sec_ConcernX")) {

							/*
							 * 5.2.1 Adiciona “mAux” ao conjunto de operações do
							 * conjunto de junção “affectedMethods”.
							 */
							pcAffectedMethods.addOperation(mAux);

							/*
							 * 5.2.2 Remove o estereótipo relacionado ao
							 * interesse “ConcernX” do método “mAux”
							 */
							mAux.removeConcernById("Sec_ConcernX");

							// 5.3 Atualiza o conjunto de estereótipos da classe
							// “clAux”
							clAux.updateListOfConcerns(false);
						}
					}
				}

				/*
				 * 6. Se o conjunto de operações do conjunto de junção
				 * “affectedMethods” é maior que zero, faça:
				 */
				if (pcAffectedMethods.getOperations().size() > 0) {
					/*
					 * 6.1 Cria um adendo “adAffectedMethods” do tipo “after” e
					 * relacione-o ao conjunto de junção “affectedMethods”.
					 */
					Advice adAffectedMethods = new Advice("adAffectedMethods",
							"adAffectedMethods", null, Advice.afterType);
					adAffectedMethods.setPointcut(pcAffectedMethods);

					/*
					 * 6.2 Adicione o conjunto de junção “affectedMethods” e o
					 * adendo “adAffectedMethods” ao aspecto “clAspect”
					 */
					aspect.addAdvice(adAffectedMethods);
					aspect.addPointcut(pcAffectedMethods);
				}

				// 7. Adicione o aspecto criado ao projeto.
				cc.addAspect(aspect);

				// 8. Adicione o interesse “ConcernX” ao projeto.
				project.addCrossCuttingConcern(cc);
			}
		}
		return false;
	}

	public boolean ref2(String stereotypeName) {
		String priStereotype = "";
		boolean isItOk = false;

		String ref2Id = "Ref2";
		RefactoringView view = getRefactoringView();
		if (view != null)
			view.addItem(ref2Id);

		if (project.getClasses() != null) {
			List<Class> lsClasses = new ArrayList<Class>(project.getClasses());
			Iterator<Class> itClasses = lsClasses.iterator();
			while (itClasses.hasNext()) {
				Class clToBeRefact = itClasses.next();
				Concern cn = null;
				List<Concern> lstConcerns = clToBeRefact
						.findConcernWhoseNameStartsWith("Pri_" + stereotypeName);
				if (lstConcerns.size() > 0) {
					Iterator<Concern> itConcerns = lstConcerns.iterator();
					while (itConcerns.hasNext()) {
						cn = itConcerns.next();
						priStereotype = cn.getId();

						if (analyseref2().contains(priStereotype)) {

							String aspectName = priStereotype + "Aspect";

							List<Operation> lsOperationAux = new ArrayList<Operation>(
									clToBeRefact.getOperations());
							Iterator<Operation> itOp = lsOperationAux
									.iterator();
							while (itOp.hasNext()) {
								Operation op = itOp.next();
								if (op.findConcernByName("Pri_" + priStereotype) != null) {
									List<Class> lsClassesAux = new ArrayList<Class>(
											project.getClasses());
									Iterator<Class> itClassesAux = lsClassesAux
											.iterator();
									while (itClassesAux.hasNext()) {
										Class clAux = itClassesAux.next();

										boolean createIntroductionMethod = false;
										boolean useIntroductionMethod = false;

										Concern primaryConcern = clAux
												.findConcernByName("Sec_"
														+ priStereotype);
										if ((primaryConcern != null)
												&& (clAux
														.hasOverridedMethods(clToBeRefact))) {
											Operation opAux = clAux
													.isOverridedInThisClass(op);
											if ((opAux != null)
													&& (!clAux
															.getId()
															.equalsIgnoreCase(
																	clToBeRefact
																			.getId()))) {
												isItOk = true;

												boolean createdCC = false;
												boolean createdAspect = false;
												boolean useCC = false;
												boolean useAspect = false;
												CrossCuttingConcern cc = null;
												Aspect as = null;
												IntroductionMethod im = null;

												if (!createdCC) {
													cc = project
															.findCrossCuttingConcernByName(priStereotype);
													if (cc == null) {
														useCC = false;
														cc = new CrossCuttingConcern(
																priStereotype);
														if (view != null)
															view.addSubItem(
																	ref2Id,
																	"The crosscutting concern \""
																			+ cc.getName()
																			+ "\" has been created.");
													} else
														useCC = true;
													createdCC = true;
												}

												if (!createdAspect) {
													as = project
															.findAspectById(aspectName);
													if (as == null) {
														useAspect = false;
														as = new Aspect(
																aspectName,
																aspectName);
														if (view != null)
															view.addSubItem(
																	ref2Id,
																	"The aspect \""
																			+ as.getName()
																			+ "\" has been created.");
													} else
														useAspect = true;
													createdAspect = true;
												}

												List<Attribute> lsAux = new ArrayList<Attribute>(
														clAux.getAttributes());
												Iterator<Attribute> itAttr = lsAux
														.iterator();
												while (itAttr.hasNext()) {
													Attribute attr = itAttr
															.next();
													Concern cnAttr = attr
															.findConcernByName("Pri_"
																	+ priStereotype);
													if (cnAttr != null) {
														Attribute newAttr = new Attribute(
																attr);
														newAttr.removeAllConcerns();
														Attribute attrAux = as
																.findAttributeByName(attr
																		.getName());
														if (attrAux == null) {
															as.addAttribute(newAttr);
														}
														clAux.removeAttributeById(attr);
														clAux.updateListOfConcerns(false);
														project.removeAssociationByClassId(
																attr.getType()
																		.getId(),
																clToBeRefact
																		.getId());
														if (view != null)
															view.addSubItem(
																	ref2Id,
																	"The attribute \""
																			+ newAttr
																					.getName()
																			+ "\" has been moved to the aspect \""
																			+ as.getName()
																			+ "\", because it totally represents a \""
																			+ priStereotype
																			+ "\" concern.");
													}
												}

												if (opAux.getConcerns().size() == 1) {
													if (!createIntroductionMethod) {
														im = as.findPointcutById(aspectName
																+ "."
																+ op.getId());
														if (im == null) {
															useIntroductionMethod = false;
															im = new IntroductionMethod(
																	aspectName
																			+ "."
																			+ op.getId(),
																	op.getName(),
																	new Type(
																			op.getReturnType()),
																	false);
														} else
															useIntroductionMethod = true;
														createIntroductionMethod = true;
													}

													im.addParameters(new ArrayList<Parameter>(
															op.getParameters()));
													im.addTarget(new Class(
															clAux));
													if (!im.isExistTarget(clToBeRefact
															.getId())) {
														im.addTarget(new Class(
																clToBeRefact));
														if (view != null)
															view.addSubItem(
																	ref2Id,
																	"The operation \""
																			+ op.getName()
																			+ "\" has been introduced in the classes \""
																			+ clToBeRefact
																					.getName()
																			+ "\" by the aspect \""
																			+ as.getName()
																			+ "\".");
													}
													if (view != null)
														view.addSubItem(
																ref2Id,
																"The operation \""
																		+ op.getName()
																		+ "\" has been introduced in the classes \""
																		+ clAux.getName()
																		+ "\" by the aspect \""
																		+ as.getName()
																		+ "\".");

													clAux.removeOperationById(opAux
															.getId());
													clAux.updateListOfConcerns(false);
													clToBeRefact
															.removeOperationById(op
																	.getId());

													if (!useIntroductionMethod)
														as.addPointcut(im);
												}
												clToBeRefact
														.updateListOfConcerns(true);
												if (!useAspect)
													cc.addAspect(as);
												if (!useCC)
													project.addCrossCuttingConcern(cc);
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		return isItOk;
	}

	public boolean ref3(String stereotypeName) {
		String secStereotype = "";
		boolean isItOk = false;

		String ref3Id = "Ref3";
		RefactoringView view = getRefactoringView();
		if (view != null)
			view.addItem(ref3Id);

		if (project.getClasses() != null) {
			List<Class> lsClasses = new ArrayList<Class>(project.getClasses());
			Iterator<Class> itClasses = lsClasses.iterator();
			Class clToBeRefact = null;
			while (itClasses.hasNext()) {
				clToBeRefact = itClasses.next();
				List<Concern> lstConcerns = clToBeRefact
						.findConcernWhoseNameStartsWith("Sec_" + stereotypeName);
				if (lstConcerns.size() > 0) {
					Iterator<Concern> itConcerns = lstConcerns.iterator();
					Concern cn = null;
					while (itConcerns.hasNext()) {
						cn = itConcerns.next();
						secStereotype = cn.getId();

						if (analyseref3().contains(secStereotype)) {

							String aspectName = secStereotype + "Aspect";
							boolean ret = false;
							Concern primaryConcern = null;

							boolean useCC = false;
							boolean useAspect = false;
							boolean createdCC = false;
							boolean createdAs = false;
							CrossCuttingConcern cc = null;
							Aspect as = null;

							List<Class> classes = new ArrayList<Class>(
									project.getClasses());
							Iterator<Class> newItClasses = classes.iterator();
							while ((newItClasses.hasNext()) && (!ret)) {
								Class cl = newItClasses.next();
								primaryConcern = cl.findConcernByName("Pri_"
										+ secStereotype);
								if (primaryConcern != null)
									ret = true;
							}

							if (ret == false) {
								isItOk = true;
								if (!createdCC) {
									cc = project
											.findCrossCuttingConcernByName(secStereotype);
									if (cc == null) {
										useCC = false;
										cc = new CrossCuttingConcern(
												secStereotype);
										if (view != null)
											view.addSubItem(
													ref3Id,
													"The crosscutting concern \""
															+ cc.getName()
															+ "\" has been created.");

									} else {
										useCC = true;
									}
									createdCC = true;

								}

								if (!createdAs) {
									as = project.findAspectById(aspectName);
									if (as == null) {
										useAspect = false;
										as = new Aspect(aspectName, aspectName);
										if (view != null)
											view.addSubItem(
													ref3Id,
													"The aspect \""
															+ as.getName()
															+ "\" has been created.");
									} else
										useAspect = true;
									createdAs = true;
								}

								// Add the attributes totally affected.
								List<Attribute> lsAux = new ArrayList<Attribute>(
										clToBeRefact.getAttributes());
								Iterator<Attribute> itAttr = lsAux.iterator();
								while (itAttr.hasNext()) {
									Attribute attr = itAttr.next();
									Concern cnAttr = attr
											.findConcernByName("Pri_"
													+ secStereotype);
									if (cnAttr != null) {
										Attribute newAttr = new Attribute(attr);
										newAttr.removeAllConcerns();
										Attribute attrAux = as
												.findAttributeByName(attr
														.getName());
										if (attrAux == null) {
											as.addAttribute(newAttr);
										}
										clToBeRefact.removeAttributeById(attr);
										clToBeRefact
												.updateListOfConcerns(false);
										project.removeAssociationByClassId(attr
												.getType().getId(),
												clToBeRefact.getId());
										if (view != null)
											view.addSubItem(
													ref3Id,
													"The attribute \""
															+ newAttr.getName()
															+ "\" has been moved to the aspect \""
															+ as.getName()
															+ "\", because it totally represents a \""
															+ secStereotype
															+ "\" concern.");
									}
								}

								// Add the operations totally affected.
								List<Operation> lsOpAux = new ArrayList<Operation>(
										clToBeRefact.getOperations());
								Iterator<Operation> itOp = lsOpAux.iterator();
								while (itOp.hasNext()) {
									boolean createdIntroductionMethod = false;
									boolean useIntroductionMethod = false;
									IntroductionMethod im = null;
									Operation op = itOp.next();
									Concern cnOp = op.findConcernByName("Pri_"
											+ secStereotype);
									if ((cnOp != null)
											&& (op.getConcerns().size() == 1)
											&& (!clToBeRefact.isOverrided(op))) {
										Operation newOp = new Operation(op);
										newOp.removeAllConcerns();

										if (!createdIntroductionMethod) {
											im = as.findPointcutById(aspectName
													+ "." + op.getId());
											if (im == null) {
												im = new IntroductionMethod(
														aspectName + "."
																+ op.getId(),
														op.getName(),
														new Type(
																op.getReturnType()),
														false);
											} else {
												useIntroductionMethod = true;
											}
											createdIntroductionMethod = true;
										}

										im.addParameters(new ArrayList<Parameter>(
												op.getParameters()));
										im.addTarget(new Class(clToBeRefact));

										if (!useIntroductionMethod) {
											as.addPointcut(im);
										}

										if (view != null)
											view.addSubItem(
													ref3Id,
													"The operation \""
															+ op.getName()
															+ "\" has been introduced in the class \""
															+ clToBeRefact
																	.getName()
															+ "\" by the aspect \""
															+ as.getName()
															+ "\".");

										clToBeRefact.removeOperationById(op
												.getId());
										clToBeRefact
												.updateListOfConcerns(false);
										if (view != null)
											view.addSubItem(
													ref3Id,
													"The operation \""
															+ newOp.getName()
															+ "\" has been moved to the aspect \""
															+ as.getName()
															+ "\", because it totally represents a \""
															+ secStereotype
															+ "\" concern.");
									}
								}

								if (!useAspect) {
									cc.addAspect(as);
								}
								if (!useCC) {
									project.addCrossCuttingConcern(cc);
								}
							}
						}
					}
				}
			}
		}
		return isItOk;
	}

	public String analyseref1() {
		String priStereotype = "";
		String stereotypes = "";

		if (project.getClasses() != null) {
			List<Class> lsClasses = new ArrayList<Class>(project.getClasses());
			Iterator<Class> itClasses = lsClasses.iterator();
			Concern cn = null;
			Class clToBeRefact = null;
			while (itClasses.hasNext()) {
				clToBeRefact = itClasses.next();
				List<Concern> lstConcerns = clToBeRefact
						.findConcernWhoseNameStartsWith("Pri_");
				if (lstConcerns.size() > 0) {
					Iterator<Concern> itConcerns = lstConcerns.iterator();
					while (itConcerns.hasNext()) {
						cn = itConcerns.next();
						priStereotype = cn.getId();
						Concern primaryConcern = null;
						List<Class> classes = new ArrayList<Class>(
								project.getClasses());
						Iterator<Class> newItClasses = classes.iterator();
						boolean ret = false;
						while ((newItClasses.hasNext()) && (!ret)) {
							Class cl = newItClasses.next();
							primaryConcern = cl.findConcernByName("Sec_"
									+ priStereotype);
							if ((primaryConcern != null)
									&& (cl.hasOverridedMethods(clToBeRefact))) {
								ret = true;
							}
						}
						if (!ret) {
							if (!stereotypes.contains(priStereotype))
								stereotypes = stereotypes + priStereotype
										+ ", ";
							ret = true;
						}
					}

				}
			}
		}

		// Retira a ultima vírgula
		if (stereotypes.length() > 0)
			stereotypes = stereotypes
					.substring(0, stereotypes.lastIndexOf(","));
		return stereotypes;
	}

	public String analyseref2() {
		String priStereotype = "";
		String stereotypes = "";

		if (project.getClasses() != null) {
			List<Class> lsClasses = new ArrayList<Class>(project.getClasses());
			Iterator<Class> itClasses = lsClasses.iterator();
			while (itClasses.hasNext()) {
				Class clToBeRefact = itClasses.next();
				Concern cn = null;
				List<Concern> lstConcerns = clToBeRefact
						.findConcernWhoseNameStartsWith("Pri_");
				if (lstConcerns.size() > 0) {
					Iterator<Concern> itConcerns = lstConcerns.iterator();
					while (itConcerns.hasNext()) {
						cn = itConcerns.next();
						priStereotype = cn.getId();
						List<Operation> lsOperationAux = new ArrayList<Operation>(
								clToBeRefact.getOperations());
						Iterator<Operation> itOp = lsOperationAux.iterator();
						while (itOp.hasNext()) {
							Operation op = itOp.next();
							if (op.findConcernByName("Pri_" + priStereotype) != null) {
								List<Class> lsClassesAux = new ArrayList<Class>(
										project.getClasses());
								Iterator<Class> itClassesAux = lsClassesAux
										.iterator();
								boolean ret = false;
								while ((itClassesAux.hasNext()) && (!ret)) {
									Class clAux = itClassesAux.next();
									Concern primaryConcern = clAux
											.findConcernByName("Sec_"
													+ priStereotype);
									if ((primaryConcern != null)
											&& (clAux
													.hasOverridedMethods(clToBeRefact))) {
										if (!stereotypes
												.contains(priStereotype))
											stereotypes = stereotypes
													+ priStereotype + ", ";
										ret = true;
									}
								}
							}
						}
					}
				}
			}
		}
		// Retira a ultima vírgula
		if (stereotypes.length() > 0)
			stereotypes = stereotypes
					.substring(0, stereotypes.lastIndexOf(","));
		return stereotypes;
	}

	public String analyseref3() {
		String secStereotype = "";
		String stereotypes = "";

		if (project.getClasses() != null) {
			List<Class> lsClasses = new ArrayList<Class>(project.getClasses());
			Iterator<Class> itClasses = lsClasses.iterator();
			Class clToBeRefact = null;
			while (itClasses.hasNext()) {
				clToBeRefact = itClasses.next();
				List<Concern> lstConcerns = clToBeRefact
						.findConcernWhoseNameStartsWith("Sec_");
				Concern cn = null;
				if (lstConcerns.size() > 0) {
					Iterator<Concern> itConcerns = lstConcerns.iterator();
					while (itConcerns.hasNext()) {
						cn = itConcerns.next();
						secStereotype = cn.getId();
						Concern primaryConcern = null;

						boolean ret = false;
						List<Class> classes = new ArrayList<Class>(
								project.getClasses());
						Iterator<Class> newItClasses = classes.iterator();
						while ((newItClasses.hasNext()) && (!ret)) {
							Class cl = newItClasses.next();
							primaryConcern = cl.findConcernByName("Pri_"
									+ secStereotype);
							if (primaryConcern != null)
								ret = true;
						}

						if (!ret) {
							if (!stereotypes.contains(secStereotype))
								stereotypes = stereotypes + secStereotype
										+ ", ";
						}
					}
				}
			}
		}
		// Retira a ultima vírgula
		if (stereotypes.length() > 0)
			stereotypes = stereotypes
					.substring(0, stereotypes.lastIndexOf(","));
		return stereotypes;
	}

	public Project getProject() {
		return this.project;
	}

	/*
	 * public boolean ref4() { List<Package> pcks = new ArrayList<Package>();
	 * pcks = project.getPackages(); String secStereotype = ""; boolean isItOk =
	 * false;
	 * 
	 * Iterator itPcks = pcks.iterator(); while(itPcks.hasNext()) { Package pck
	 * = (Package)itPcks.next();
	 * 
	 * Iterator itClasses = pck.getClasses().iterator(); boolean ret = false;
	 * Concern cn = null; Class clToBeRefact = null; while((itClasses.hasNext())
	 * && (ret == false)) { clToBeRefact = (Class)itClasses.next(); cn =
	 * clToBeRefact.findConcernWhoseNameStartsWith("Sec_"); if (cn != null) ret
	 * = true; } if (clToBeRefact != null) { isItOk = true;
	 * 
	 * if (cn != null) secStereotype = cn.getId(); ret= false; Concern
	 * primaryConcern = null; while((itClasses.hasNext()) && (ret == false)) {
	 * Class cl = (Class)itClasses.next(); primaryConcern =
	 * cl.findConcernByName("Pri_" + secStereotype); if (primaryConcern != null)
	 * ret = true; } if (primaryConcern == null) { CrossCuttingConcern cc = new
	 * CrossCuttingConcern(secStereotype); String aspectName = secStereotype +
	 * "Aspect"; Aspect as = new Aspect(aspectName, aspectName); List<Attribute>
	 * lsAux = new ArrayList<Attribute>(clToBeRefact.getAttributes());
	 * 
	 * Iterator itAttr = lsAux.iterator(); while(itAttr.hasNext()) { Attribute
	 * attr = (Attribute) itAttr.next(); Concern cnAttr =
	 * attr.findConcernByName("Sec_" + secStereotype); if (cnAttr != null) {
	 * Attribute newAttr = new Attribute(attr); newAttr.removeAllConcerns();
	 * as.addAttribute(newAttr); clToBeRefact.removeAttributeById(attr); } }
	 * cc.addAspect(as); project.addCrossCuttingConcern(cc); } else { isItOk =
	 * false; } } } return isItOk; }
	 */

	/*public void ObjectToHTML(IWorkbenchWindow window) {
		try {
			createAliases();

			stream.toXML(project, new FileOutputStream(modelXML));
			Transformer transformer1 = transformerFactory
					.newTransformer(new StreamSource(diagramTemplateXSLT));
			transformer1.transform(new StreamSource(modelXML),
					new StreamResult(new FileOutputStream(stereotypedModel,
							false)));

			// Progress Bar
			ProgressMonitorDialog dialog = new ProgressMonitorDialog(
					window.getShell());
			try {
				dialog.run(true, true, new IRunnableWithProgress() {
					public void run(IProgressMonitor monitor) {
						monitor.beginTask("Applying the refactorings ...", 100);
						createXMLFile();
						monitor.worked(80);
						monitor.worked(100);
						monitor.done();
					}
				});
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception ex) {
			System.out.println("File error");
		}
	}*/
	
	public void ObjectToMVCASE(IWorkbenchWindow window) {
		try {
			createAliases();

			stream.toXML(project, new FileOutputStream(modelXML));
			Transformer transformer1 = transformerFactory
					.newTransformer(new StreamSource(mvcaseTypesTemplate));
			transformer1.transform(new StreamSource(modelXML),
					new StreamResult(new FileOutputStream(mvcaseTypesFile,
							false)));

			Transformer transformer2 = transformerFactory
					.newTransformer(new StreamSource(mvcaseLabelTemplate));
			transformer2.transform(new StreamSource(modelXML),
					new StreamResult(new FileOutputStream(mvcaseLabelFile,
							false)));

			Transformer transformer3 = transformerFactory
				.newTransformer(new StreamSource(mvcaseModelTemplate));
			transformer3.transform(new StreamSource(modelXML),
			new StreamResult(new FileOutputStream(mvcaseModelFile,
					false)));
			
			Transformer transformer4 = transformerFactory
				.newTransformer(new StreamSource(mvcaseDiagramTemplate));
			transformer4.transform(new StreamSource(modelXML),
				new StreamResult(new FileOutputStream(mvcaseDiagramFile,
				false)));
			
			// Progress Bar
			ProgressMonitorDialog dialog = new ProgressMonitorDialog(
					window.getShell());
			try {
				dialog.run(true, true, new IRunnableWithProgress() {
					public void run(IProgressMonitor monitor) {
						monitor.beginTask("Applying the refactorings ...", 100);
						createXMLFile();
						monitor.worked(80);
						monitor.worked(100);
						monitor.done();
					}
				});
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println(ex.getMessage());
		}
	}


	public void ObjectToXML(IWorkbenchWindow window) {
		try {
			createAliases();

			stream.toXML(project, new FileOutputStream(modelXML));
			Transformer transformer1 = transformerFactory
					.newTransformer(new StreamSource(diagramTemplateXSLT));
			transformer1.transform(new StreamSource(modelXML),
					new StreamResult(
							new FileOutputStream(diagramXMIFile, false)));

			stream.toXML(project, new FileOutputStream(modelXML));
			Transformer transformer2 = transformerFactory
					.newTransformer(new StreamSource(packageTemplateXSLT));
			transformer2.transform(new StreamSource(modelXML),
					new StreamResult(
							new FileOutputStream(packageXMIFile, false)));

			// Progress Bar
			ProgressMonitorDialog dialog = new ProgressMonitorDialog(
					window.getShell());
			try {
				dialog.run(true, true, new IRunnableWithProgress() {
					public void run(IProgressMonitor monitor) {
						monitor.beginTask("Building the stereotyped model ...",
								100);
						createXMLFile();
						monitor.worked(80);
						/*
						 * monitor.setTaskName("Building the Jude project ...");
						 * createJudeProject();
						 */
						monitor.worked(100);
						monitor.done();
					}
				});
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception ex) {
			System.out.println("Ocorreu um erro ao gerar o arquivo XML.");
		}
	}

	/*
	 * public void createJudeProject() { try { ProjectAccessor prjAccessor =
	 * ProjectAccessorFactory .getProjectAccessor();
	 * 
	 * prjAccessor.importXMI(stereotypedModel);
	 * prjAccessor.saveAs(judeProjectName); prjAccessor.close();
	 * 
	 * } catch (Throwable e) {
	 * System.out.println("Ocorreu um erro ao importar o arquivo XMI no Jude");
	 * e.printStackTrace(); } }
	 */

	public void createXMLFile() {
		BufferedReader inputFile;
		BufferedWriter outputFile;
		String line;

		try {
			try {
				// Create channel on the source
				FileChannel srcChannel = new FileInputStream(judeStandard)
						.getChannel();

				// Create channel on the destination
				FileChannel dstChannel = new FileOutputStream(stereotypedModel)
						.getChannel();

				// Copy file contents from source to destination
				dstChannel.transferFrom(srcChannel, 0, srcChannel.size());

				// Close the channels
				srcChannel.close();
				dstChannel.close();
			} catch (IOException e) {
				System.out.println("Ocorreu um erro ao copiar o arquivo.");
			}

			outputFile = new BufferedWriter(new FileWriter(stereotypedModel,
					true));
			inputFile = new BufferedReader(new FileReader(packageXMIFile));

			line = inputFile.readLine();
			line = inputFile.readLine();
			while ((line.substring(0, 3)).equals("<ns") && line != null) {
				line = inputFile.readLine();
			}

			while (line != null) {
				outputFile.write(line);
				outputFile.newLine();
				line = inputFile.readLine();
			}

			inputFile.close();

			outputFile.write("          </UML:Namespace.ownedElement>");
			outputFile.newLine();
			outputFile.write("        </UML:Package>");
			outputFile.newLine();

			inputFile = new BufferedReader(new FileReader(diagramXMIFile));

			line = inputFile.readLine();
			line = inputFile.readLine();
			while ((line.substring(0, 3)).equals("<ns") && line != null) {
				line = inputFile.readLine();
			}

			boolean sair = false;
			while (line != null && !sair) {
				if (!(line.substring(0, 17)).equals("    <UML:Primitive")) {
					outputFile.write("      </UML:Namespace.ownedElement>");
					outputFile.newLine();
					outputFile.write("    </UML:Model>");
					outputFile.newLine();
					outputFile.write(line);
					outputFile.newLine();
					sair = true;
				} else {
					outputFile.write(line);
					outputFile.newLine();
					line = inputFile.readLine();
				}
			}

			if (sair) {
				line = inputFile.readLine();
				while (line != null) {
					outputFile.write(line);
					outputFile.newLine();
					line = inputFile.readLine();
				}
			}
			inputFile.close();

			outputFile.write("  </XMI.content>");
			outputFile.newLine();
			outputFile.write("</XMI>");
			outputFile.newLine();

			outputFile.close();

		} catch (Exception e) {
			System.out.println("Ocorreu um erro ao gerar o arquivo.");
		}
	}

	public void XMLToObject() {
		createAliases();
		try {
			File fileXmlIn = new File(modelXML);
			if (fileXmlIn.exists()) {
				project = (Project) stream
						.fromXML(new FileInputStream(modelXML));
			} else {
				System.out.println("Arquivo \"" + modelXML + "\" inexistente.");
			}
		} catch (Exception ex) {
			System.out.println("Ocorreu um erro ao gerar o arquivo XML.");
		}
	}

}
