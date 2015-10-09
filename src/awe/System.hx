package awe;

import awe.Filter;
import awe.util.Bag;
/** A basic system. **/
class System {
	/** The engine that contains this sytem. **/
	public var engine(default, null): Engine;
	/** If this system is enabled or not. **/
	public var enabled: Bool;
	/** Create a new, empty system. **/
	public function new() {
		enabled = false;
		engine = null;
	}
	/**
		Check if this system should be processed.
		@return If this should be processed or not.
	**/
	public function shouldProcess(): Bool
		return enabled;

	/**
		Initializes this system in the `Engine`.
		@param engine The `Engine` to initialize this in.
	**/
	public function inititialize(engine: Engine): Void
		this.engine = engine;

	/**
		Updates this system.
		@param delta The change in time in seconds.
	**/
	public function update(delta: Float): Void {}
}

class EntitySystem extends System {
	/** The filter to check an entity against before adding to this system. **/
	public var filter(default, null): Filter;
	public var matchers(default, null): Bag<Int>;
	public function new(filter: Filter) {
		super();
		this.filter = filter;
		this.matchers = new Bag();
	}
}