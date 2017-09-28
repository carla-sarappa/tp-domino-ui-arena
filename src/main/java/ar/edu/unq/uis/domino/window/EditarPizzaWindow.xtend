package ar.edu.unq.uis.domino.window

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.ColumnLayout

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.uis.domino.appmodel.PizzaAppModel
import org.uqbar.arena.widgets.List
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.bindings.PropertyAdapter
import ar.edu.unq.uis.domino.model.Ingrediente
import ar.edu.unq.uis.domino.model.Distribucion
import org.uqbar.arena.widgets.Button
import ar.edu.unq.uis.domino.model.IngredienteDistribuido
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.aop.windows.TransactionalDialog
import ar.edu.unq.uis.domino.model.Pizza

class EditarPizzaWindow extends EditarConIngredientesWindow<PizzaAppModel> {
	
	new(WindowOwner owner, Pizza pizza) {
		super(owner, createViewModel(pizza))
		title = defaultTitle()
	}
	
	static def createViewModel(Pizza pizza){
		val model = new PizzaAppModel()
		model.elemento = pizza
		return model
	}
	
	override defaultTitle() {
		"Editar pizza"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		super.createFormPanel(mainPanel)	
		crearPanelListas(mainPanel)
		crearTablaIngredientesAgregados(mainPanel)
	}
	
		
	override def createMainTemplate(Panel mainPanel) {
		title = "Pizza"
		super.createMainTemplate(mainPanel)
	}
	
	override onAgregarIngredienteClick() {
		modelObject.agregarIngrediente
	}
	
	
	
}