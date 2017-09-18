package ar.edu.unq.uis.domino.window

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.ColumnLayout

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.uis.domino.viewmodel.PizzaViewModel
import org.uqbar.arena.widgets.List
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.bindings.PropertyAdapter
import ar.edu.unq.uis.domino.model.Ingrediente

class CrearElementoWindow extends Dialog<PizzaViewModel>{
	
	new(WindowOwner owner, PizzaViewModel model) {
		super(owner, model)
	}
	
	new(MenuWindow window) {
		super(window, new PizzaViewModel)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel).layout = new ColumnLayout(2)
		new Label(form).text = "Nombre"
		
		new TextBox(form) => [
			value <=> "pizza.nombre"
			width = 200	
		]
		
		new Label(form).text = "Precio"
			
		new NumericField(form) => [
			value <=> "pizza.precioBase"
			width = 100
		]	
		
		new Selector(form) => [
            //value <=> "selectedProduct"
            val bindingItems = items <=> "ingredientes"
     		bindingItems.adapter = new PropertyAdapter(typeof(Ingrediente), "nombre")
            width = 220
            height = 220
		]	
		
//		new List(form) => [
//            items <=> "distribucion"
//            //value <=> "selectedProduct"
//            width = 220
//            height = 220
//		]		
		
	}
	
	override def createMainTemplate(Panel mainPanel) {
		title = "Pizza"
		super.createMainTemplate(mainPanel)
	}
	
}