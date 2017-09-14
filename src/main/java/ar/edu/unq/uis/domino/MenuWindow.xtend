package ar.edu.unq.uis.domino

import org.uqbar.arena.windows.SimpleWindow
import ar.edu.unq.uis.domino.Menu
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.uis.runnable.DominoApplication
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.bindings.NotNullObservable


import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout

class MenuWindow extends SimpleWindow<Menu> {
	
	new(DominoApplication application) {
		super(application, new Menu)
	}
	
	override def createMainTemplate(Panel mainPanel) {
		title = "Domino Pizza - Menu"
		taskDescription = "Elegi tu promo"

		
		super.createMainTemplate(mainPanel)
	}
	
	override protected addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			caption = "Cerrar"
			onClick([|])
			
		]
	}
	
	def addPanelActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Crear"
			onClick([|])
		]
		
		new Button(actionsPanel) => [
			caption = "Editar"
			onClick([|])
			
		]

		new Button(actionsPanel) => [
			caption = "Eliminar"
			onClick([|])
		]	
	}

	
	
	override protected createFormPanel(Panel mainPanel) {
		val horizontalPanel = new Panel(mainPanel)
		horizontalPanel.layout = new HorizontalLayout()
				
		this.createResultsGrid(horizontalPanel)
		
		val verticalButtonPanel = new Panel(horizontalPanel)
		verticalButtonPanel.layout = new VerticalLayout()
		
		this.addPanelActions(verticalButtonPanel)
		
		this.createGridActions(mainPanel)
	}
	
	def protected createResultsGrid(Panel mainPanel) {
		val table = new Table<Pizza>(mainPanel, typeof(Pizza)) => [
			items <=> "promos"
			//value <=> "promoSeleccionada"
			numberVisibleRows = 8
		]
		this.describeResultsGrid(table)
	}


	def void describeResultsGrid(Table<Pizza> table) {
		new Column<Pizza>(table) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("nombre")
		]

		new Column<Pizza>(table) => [
			title = "Precio"
			fixedSize = 100
			alignRight
			bindContentsToProperty("precioBase")
		]
	}
	
	def void createGridActions(Panel mainPanel) {
		// Deshabilitar los botones si no hay ningún elemento seleccionado en la grilla.
//		val elementSelected = new NotNullObservable("promoSeleccionada")
//		
//		val actionsPanel = new Panel(mainPanel).layout = new HorizontalLayout
//		
//		new Button(actionsPanel) => [
//			caption = "Editar"
//			//onClick([|this.modificarCelular])
//			bindEnabled(elementSelected)
//		]
//
//		new Button(actionsPanel) => [
//			caption = "Borrar"
//			//onClick([|modelObject.eliminarCelularSeleccionado])
//			bindEnabled(elementSelected)
//		]
	}
	
	
	
}