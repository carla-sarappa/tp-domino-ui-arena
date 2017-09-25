package ar.edu.unq.uis.domino.window

import ar.edu.unq.uis.domino.model.Plato
import ar.edu.unq.uis.domino.viewmodel.PlatoViewModel
import org.uqbar.arena.windows.WindowOwner

class AgregarPlatoWindow extends EditarPlatoWindow {

	
	new(WindowOwner owner, Plato plato) {
		super(owner, plato)
	}
	
	override defaultTitle() {
		"Crear nuevo plato"
	}
		

}