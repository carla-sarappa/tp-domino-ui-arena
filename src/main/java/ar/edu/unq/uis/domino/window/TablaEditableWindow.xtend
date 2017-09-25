package ar.edu.unq.uis.domino.window

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import ar.edu.unq.uis.domino.model.Pizza
import org.uqbar.arena.windows.Dialog
import ar.edu.unq.uis.domino.appmodel.MenuAppModel

class TablaEditableWindow extends Panel {
	
	MenuWindow menuWindow
	
	new(Container container, MenuWindow menuWindow) {
		super(container)
		this.menuWindow = menuWindow
		
		this.layout = new VerticalLayout()
		createFormPanel(this)
	}

	def addPanelActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Crear"
			onClick([|this.crearElemento])
		]
		
		new Button(actionsPanel) => [
			caption = "Editar"
			onClick([| this.editarElemento])	
		]

		new Button(actionsPanel) => [
			caption = "Eliminar"
			onClick([| menuWindow.modelObject.eliminarSeleccionado])
		]	
	}

	def createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Promos tabla editable woohoooo"
		
		val horizontalPanel = new Panel(mainPanel)
		horizontalPanel.layout = new HorizontalLayout()		
			
		this.createResultsGrid(horizontalPanel)
		
		val verticalButtonPanel = new Panel(horizontalPanel)
		verticalButtonPanel.layout = new VerticalLayout()
		
		this.addPanelActions(verticalButtonPanel)
	}
	
	def protected createResultsGrid(Panel mainPanel) {
		val table = new Table<Pizza>(mainPanel, typeof(Pizza)) => [
			items <=> "promos"
			value <=> "promoSeleccionada"
			numberVisibleRows = 3
		]
		
		new Column<Pizza>(table) => [
			title = "Nombre"
			fixedSize = 300
			bindContentsToProperty("nombre")
		]

		new Column<Pizza>(table) => [
			title = "Precio"
			fixedSize = 200
			alignRight
			bindContentsToProperty("precioBase")
		]
	}
	
	def void crearElemento() {
		this.openDialog(new CrearElementoWindow(menuWindow))
	}
	
	def void editarElemento() {
		this.openDialog(new EditarElementoWindow(menuWindow, menuWindow.modelObject.promoSeleccionada))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|
			menuWindow.modelObject.refresh
		]
		dialog.open
	}
	
	
}