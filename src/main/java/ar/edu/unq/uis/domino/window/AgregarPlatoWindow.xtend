package ar.edu.unq.uis.domino.window

import ar.edu.unq.uis.domino.model.Plato
import ar.edu.unq.uis.domino.viewmodel.PlatoViewModel
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.uis.domino.model.Pedido
import ar.edu.unq.uis.domino.appmodel.PlatoAppModel

class AgregarPlatoWindow extends EditarPlatoWindow {
	
	new(WindowOwner owner, Pedido pedido) {
		super(owner, new PlatoAppModel(pedido))
	}	

	override defaultTitle() {
		"Crear nuevo plato"
	}
	
}