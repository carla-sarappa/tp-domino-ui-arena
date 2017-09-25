package ar.edu.unq.uis.domino.window

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.uis.domino.viewmodel.PlatoViewModel
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.uis.domino.model.Plato
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.NumericField
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Selector
import ar.edu.unq.uis.domino.model.Pizza
import org.uqbar.arena.bindings.PropertyAdapter
import ar.edu.unq.uis.domino.model.Tamanio
import org.uqbar.arena.windows.SimpleWindow

class EditarPlatoWindow extends SimpleWindow<PlatoViewModel>{
	
	new(WindowOwner owner, Plato plato) {
		super(owner, new PlatoViewModel)
		title = defaultTitle()
	}
	
	
	def defaultTitle() {
		"Editar plato"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val dropdown = new Panel(mainPanel).layout = new ColumnLayout(2)
		new Label(dropdown).text = "Pizza"
		
		
		new Selector(dropdown) => [
            value <=> "pizzaSeleccionada"
            
            val bindingItems = items <=> "pizzas"
     		bindingItems.adapter = new PropertyAdapter(typeof(Pizza), "nombre")
            width = 220
            height = 220
		]	
		
		new Label(dropdown).text = "Tamaño"
			
		new Selector(dropdown) => [
            value <=> "tamanioSeleccionado"
            
            val bindingItems = items <=> "tamanios"
     		bindingItems.adapter = new PropertyAdapter(typeof(Tamanio), "nombre")
            width = 220
            height = 220
		]	
		
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}