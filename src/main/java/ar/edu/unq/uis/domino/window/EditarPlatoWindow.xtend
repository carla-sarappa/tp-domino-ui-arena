package ar.edu.unq.uis.domino.window

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
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
import ar.edu.unq.uis.domino.appmodel.PlatoAppModel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.Dialog
import org.uqbar.commons.model.utils.ObservableUtils

class EditarPlatoWindow extends EditarConIngredientesWindow<PlatoAppModel>{
	
	new(WindowOwner owner, Plato plato) {
		this(owner, createViewModel(plato))
		
	}

	new(WindowOwner owner, PlatoAppModel model) {
		super(owner, model)
		title = defaultTitle()
	}
	
	static def createViewModel(Plato plato){
		val model = new PlatoAppModel(plato)
		return model
	}
	
	
	override def defaultTitle() {
		"Editar plato"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val dropdown = new Panel(mainPanel).layout = new ColumnLayout(2)
		new Label(dropdown).text = "Pizza"
		
		
		new Selector(dropdown) => [
            value <=> "elemento.pizzaBase"
            val bindingItems = items <=> "pizzas"
     		bindingItems.adapter = new PropertyAdapter(typeof(Pizza), "nombre")
            width = 220
            height = 220
		]	
		
		new Label(dropdown).text = "Tamaño"
			
		new Selector(dropdown) => [
            value <=> "elemento.tamanio"
            val bindingItems = items <=> "tamanios"
     		bindingItems.adapter = new PropertyAdapter(typeof(Tamanio), "nombre")
            width = 220
            height = 220
		]	
		
		crearPanelAgregados(mainPanel)
	}
	
	def crearPanelAgregados(Panel mainPanel){
		new Label(mainPanel).text = "Agregados"
		crearPanelListas(mainPanel)
		crearTablaIngredientesAgregados(mainPanel)
		
	}
	
	override onAgregarIngredienteClick() {
		modelObject.agregarIngrediente
		
	}
	
}