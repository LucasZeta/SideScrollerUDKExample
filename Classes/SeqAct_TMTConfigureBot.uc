class SeqAct_TMTConfigureBot extends SequenceAction;

var() object Target;
var() float MaxFireRange;
var() object PatrolStart;
var() object PatrolEnd;

defaultproperties
{
	ObjName="Configure a TomatoBot"
		ObjCategory="Tomato"
	HandlerName="ConfigureBot"

	Target=none
	MaxFireRange=256
	PatrolStart=none
	PatrolEnd=none

	VariableLinks(1)=(ExpectedType=class'SeqVar_Object', LinkDesc="Firing Target", bWriteable=true, PropertyName=Target)
	VariableLinks(2)=(ExpectedType=class'SeqVar_Float', LinkDesc="Maximum Fire Range", bWriteable=true, PropertyName=MaxFireRange)
	VariableLinks(3)=(ExpectedType=class'SeqVar_Object', LinkDesc="Patrol Start", bWriteable=true, PropertyName=PatrolStart)
	VariableLinks(4)=(ExpectedType=class'SeqVar_Object', LinkDesc="Patrol End", bWriteable=true, PropertyName=PatrolEnd)
}