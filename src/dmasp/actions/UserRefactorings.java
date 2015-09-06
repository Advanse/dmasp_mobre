package dmasp.actions;

import java.util.ArrayList;
import java.util.List;

public class UserRefactorings {
	private List<MyRefactoring> myrefactorings;
	
	public UserRefactorings() {
		this.myrefactorings = new ArrayList<MyRefactoring>();
	}
	public void addRefactoring(MyRefactoring myRef) {
		myrefactorings.add(myRef);
	}	

	public List<MyRefactoring> getLstRef() {
		return myrefactorings;
	}

	public void setLstRef(List<MyRefactoring> lstRef) {
		this.myrefactorings = lstRef;
	}
}
