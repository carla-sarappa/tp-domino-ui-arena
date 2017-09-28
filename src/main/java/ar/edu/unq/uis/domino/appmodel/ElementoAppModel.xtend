package ar.edu.unq.uis.domino.appmodel

import ar.edu.unq.uis.domino.model.Pizza
import ar.edu.unq.uis.domino.repo.Repositories
import org.uqbar.commons.model.utils.ObservableUtils
import java.util.List
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.Entity
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
abstract class ElementoAppModel<T extends Entity> {
	T elemento

	def guardar(){
		if (elemento.isNew) {
			getRepository.create(elemento)
		} else {
			getRepository.update(elemento)	
		}	
	}
	
	abstract def CollectionBasedRepo<T> getRepository()
	
}