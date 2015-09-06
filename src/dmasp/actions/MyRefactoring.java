package dmasp.actions;



public class MyRefactoring {
	protected String name;
	protected String handler;
	
	public MyRefactoring(String name, String handler) {
		super();
		this.name = name;
		this.handler = handler;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getHandler() {
		return handler;
	}

	public void setHandler(String handler) {
		this.handler = handler;
	}
}
