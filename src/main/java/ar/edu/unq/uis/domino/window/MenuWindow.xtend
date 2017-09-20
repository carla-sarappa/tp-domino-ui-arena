package ar.edu.unq.uis.domino.window

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.uis.runnable.DominoApplication
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import ar.edu.unq.uis.domino.viewmodel.MenuViewModel
import ar.edu.unq.uis.domino.model.Pizza
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.windows.Dialog

class MenuWindow extends SimpleWindow<MenuViewModel> {
	
	new(DominoApplication application) {
		super(application, new MenuViewModel)
		modelObject.refresh
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
			alignRight
			
		]
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
			onClick([| modelObject.eliminarSeleccionado])
		]	
	}

	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Promos"
		
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
			numberVisibleRows = 12
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
		this.openDialog(new CrearElementoWindow(this))
	}
	
	def void editarElemento() {
		this.openDialog(new EditarElementoWindow(this, modelObject.promoSeleccionada))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|
			modelObject.refresh
		]
		dialog.open
	}
	
	
}