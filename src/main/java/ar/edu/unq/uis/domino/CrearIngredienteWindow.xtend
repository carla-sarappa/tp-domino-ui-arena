package ar.edu.unq.uis.domino

import org.uqbar.arena.windows.Dialog
import ar.edu.unq.uis.domino.viewmodel.CrearIngredienteViewModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.NumericField

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class CrearIngredienteWindow extends Dialog<CrearIngredienteViewModel>{
	
	new(WindowOwner owner, CrearIngredienteViewModel model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel).layout = new ColumnLayout(2)
		new Label(form).text = "Nombre"
		
		new TextBox(form) => [
			value <=> "nombre"
			width = 200	
		]
		
		new Label(form).text = "Precio"
			
		new NumericField(form) => [
			value <=> "numero"
			width = 100
		]	
		
	}
	
	override def createMainTemplate(Panel mainPanel) {
		title = "Ingredientes"
		
		
		super.createMainTemplate(mainPanel)
	}
	
	
	
}