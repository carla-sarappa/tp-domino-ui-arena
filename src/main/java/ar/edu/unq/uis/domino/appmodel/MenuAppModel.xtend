package ar.edu.unq.uis.domino.appmodel

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.uis.domino.model.Pizza
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.utils.ObservableUtils
import ar.edu.unq.uis.domino.repo.Repositories

@Accessors
@TransactionalAndObservable
class MenuAppModel {
	PizzaTablaEditableAppModel pizzaTablaEditableAppModel = new PizzaTablaEditableAppModel()
	IngredienteTablaEditableAppModel ingredienteTablaEditableAppModel = new IngredienteTablaEditableAppModel()
	

	def refresh(){
		pizzaTablaEditableAppModel.refresh
		ingredienteTablaEditableAppModel.refresh
	}
}