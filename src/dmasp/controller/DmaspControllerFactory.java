package dmasp.controller;

public class DmaspControllerFactory {
	private static DmaspController dmasp = null;	
	
	public static DmaspController getInstance() {
		if (dmasp == null) {
			dmasp = new DmaspController();
			return dmasp; 
		} else return dmasp;
	}	
	
}
