package ar.edu.unq.uis.domino.window

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.uis.runnable.DominoApplication
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import ar.edu.unq.uis.domino.appmodel.MenuAppModel
import ar.edu.unq.uis.domino.model.Pizza
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

class MenuWindow extends SimpleWindow<MenuAppModel> {
	
	new(WindowOwner parent) {
		super(parent, new MenuAppModel)
	}
	
	override def createMainTemplate(Panel mainPanel) {
		title = "Domino Pizza - Menu"
		taskDescription = "Elegi tu promo"
		
		super.createMainTemplate(mainPanel)

	}
	
	override protected addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			caption = "Cerrar"
			onClick([| this.close])
			alignRight
			
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		new PizzaTablaEditable(mainPanel, modelObject.pizzaTablaEditableAppModel, this) => [
			nombreTabla = "Promos"
		]
		 
		new IngredienteTablaEditable(mainPanel, modelObject.ingredienteTablaEditableAppModel, this) => [
			nombreTabla = "Ingredientes disponibles"
		]

	}
	
}