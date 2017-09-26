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
import ar.edu.unq.uis.domino.appmodel.PizzaTablaEditableAppModel
import org.uqbar.arena.windows.WindowOwner

class PizzaTablaEditable extends TablaEditable<Pizza> {
	
	PizzaTablaEditableAppModel pizzaTablaEditableAppModel
	
	new(Container container, PizzaTablaEditableAppModel pizzaTablaEditableAppModel, WindowOwner windowOwner) {
		super(container, pizzaTablaEditableAppModel, windowOwner)
	}

	
	override getTypeOfTableElement() {
		return typeof(Pizza)
	}
	
	override crearVentanaEdicion() {
		new EditarPizzaWindow(windowOwner, tablaEditableAppModel.elementoSeleccionado)
	}
	
	override crearVentanaCreacion() {
		new EditarPizzaWindow(windowOwner, new Pizza())
	}
	
	
	
	
	
	
}