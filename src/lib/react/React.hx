package react;

import react.ReactComponent.ReactElement;
import haxe.macro.Context;
import haxe.macro.Expr;

/**
	https://facebook.github.io/react/docs/react-api.html
**/
#if (!react_global)
@:jsRequire("react")
#end
@:native('React')
extern class React
{
	#if !macro
	/**
		https://facebook.github.io/react/docs/react-api.html#react.proptypes
	**/
	public static var PropTypes(default, null):ReactPropTypes;

	/**
		https://facebook.github.io/react/docs/react-api.html#createelement
	**/
	#if (debug || react_no_inline)
	public static function createElement(type:Dynamic, ?attrs:Dynamic, children:haxe.extern.Rest<Dynamic>):ReactElement;
	#end
	
	@:noCompletion
	@:native('createElement')
	static function _createElement(type:Dynamic, ?attrs:Dynamic, children:haxe.extern.Rest<Dynamic>):ReactElement;

	/**
		https://facebook.github.io/react/docs/react-api.html#cloneelement
	**/
	public static function cloneElement(element:ReactElement, ?attrs:Dynamic, children:haxe.extern.Rest<Dynamic>):ReactElement;

	/**
		https://facebook.github.io/react/docs/react-api.html#isvalidelement
	**/
	public static function isValidElement(object:Dynamic):Bool;

	/**
		https://facebook.github.io/react/docs/react-api.html#react.children
	**/
	public static var Children:ReactChildren;
	
	#end
	
	#if (!debug && !react_no_inline)
	macro public static function createElement(type:Expr, rest:Array<Expr>):Expr {
		var attrs = null;
		var children = null;
		if (rest != null && rest.length > 0) {
			attrs = rest[0];
			children = rest.slice(1);
		}
		return ReactMacro.inlineElement(type, attrs, children, Context.currentPos());
	}
	#end
}

/**
	https://facebook.github.io/react/docs/react-api.html#react.children
**/
extern interface ReactChildren
{
	/**
		https://facebook.github.io/react/docs/react-api.html#react.children.map
	**/
	function map(children:Dynamic, fn:ReactElement->ReactElement):Dynamic;

	/**
		https://facebook.github.io/react/docs/react-api.html#react.children.foreach
	**/
	function foreach(children:Dynamic, fn:ReactElement->Void):Void;

	/**
		https://facebook.github.io/react/docs/react-api.html#react.children.count
	**/
	function count(children:Dynamic):Int;

	/**
		https://facebook.github.io/react/docs/react-api.html#react.children.only
	**/
	function only(children:Dynamic):ReactElement;

	/**
		https://facebook.github.io/react/docs/react-api.html#react.children.toarray
	**/
	function toArray(children:Dynamic):Array<Dynamic>;
}
