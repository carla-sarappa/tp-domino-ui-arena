package ar.edu.unq.uis.domino.window

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import ar.edu.unq.uis.domino.model.Pizza
import org.uqbar.arena.widgets.tables.Table
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.windows.Dialog
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.uis.domino.appmodel.TablaEditableAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.Window
import org.uqbar.commons.model.Entity
import ar.edu.unq.uis.domino.adapters.MoneyAdapter

@Accessors
abstract class TablaEditable<T extends Entity> extends Panel {
	
	TablaEditableAppModel<T> tablaEditableAppModel
	WindowOwner windowOwner
	
	new(Container container, TablaEditableAppModel<T> tablaEditableAppModel, WindowOwner windowOwner) {
		super(container, tablaEditableAppModel)
		this.tablaEditableAppModel = tablaEditableAppModel
		this.windowOwner = windowOwner
		
		this.layout = new VerticalLayout()
		createFormPanel(this)
	}
	
	abstract def String getTitle()

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
			onClick([| tablaEditableAppModel.eliminarSeleccionado])
		]	
	}

	def createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = getTitle()
		
		val horizontalPanel = new Panel(mainPanel)
		horizontalPanel.layout = new HorizontalLayout()		
			
		this.createResultsGrid(horizontalPanel)
		
		val verticalButtonPanel = new Panel(horizontalPanel)
		verticalButtonPanel.layout = new VerticalLayout()
		
		this.addPanelActions(verticalButtonPanel)
	}
	
	abstract def Class<T> getTypeOfTableElement()
	
	def protected createResultsGrid(Panel mainPanel) {
		val table = new Table<T>(mainPanel, getTypeOfTableElement()) => [
			items <=> "elementos"
			value <=> "elementoSeleccionado"
			numberVisibleRows = 3
		]
		
		new Column<T>(table) => [
			title = "Nombre"
			fixedSize = 300
			bindContentsToProperty("nombre")
		]

		new Column<T>(table) => [
			title = "Precio"
			fixedSize = 200
			alignRight
			bindContentsToProperty("precio").setTransformer(new MoneyAdapter())
			
		]
	}
	
	def void crearElemento() {
		this.openDialog(crearVentanaCreacion)
	}
	
	abstract def Dialog<?> crearVentanaEdicion()
	abstract def Dialog<?> crearVentanaCreacion()
	
	def void editarElemento() {
		this.openDialog(crearVentanaEdicion)
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|
			tablaEditableAppModel.refresh
		]
		dialog.open
	}
}