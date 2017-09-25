package ar.edu.unq.uis.domino.appmodel

import ar.edu.unq.uis.domino.model.Pizza
import ar.edu.unq.uis.domino.repo.Repositories
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class PizzaTablaEditableAppModel extends TablaEditableAppModel<Pizza>{
	
	override getRepository() {
		Repositories.getPizzas()
	}
	
}