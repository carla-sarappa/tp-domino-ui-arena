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
abstract class TablaEditableAppModel<T extends Entity> {
	T elementoSeleccionado
	
	def List<T> getElementos(){
		getRepository().allInstances
	}
		
	def eliminarSeleccionado() {
		if (elementoSeleccionado == null){
			return
		}
		getRepository.delete(elementoSeleccionado)
		elementoSeleccionado = null
		refresh
	}
	
	def refresh(){
		ObservableUtils.firePropertyChanged(this, "elementos", getElementos)
	}
	
	abstract def CollectionBasedRepo<T> getRepository()
}