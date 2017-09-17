package ar.edu.unq.uis.runnable
import org.uqbar.arena.windows.Window
import org.uqbar.arena.Application
import ar.edu.unq.uis.domino.window.MenuWindow

class DominoApplication extends Application {
	new(DominoBootstrap bootstrap) {
		super(bootstrap)
	}

	static def void main(String[] args) {
		new DominoApplication(new DominoBootstrap).start()
	}

	override protected Window<?> createMainWindow() {
		return new MenuWindow(this)
	}
	
}