package ar.edu.unq.uis.domino

import org.uqbar.arena.windows.SimpleWindow
import ar.edu.unq.uis.domino.Menu
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.uis.runnable.DominoApplication

class MenuWindow extends SimpleWindow<Menu> {
	
	new(DominoApplication application) {
		super(application, new Menu)
	}
	
	override protected addActions(Panel arg0) {
		
	}
	
	override protected createFormPanel(Panel arg0) {
		
	}
	
}