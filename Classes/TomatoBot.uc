class TomatoBot extends UTBot;

var() actor Target;
var() float MaxFireRange;
var() actor PatrolStart;
var() actor PatrolEnd;

function ConfigureBot(SeqAct_TMTConfigureBot Action)
{
	Target = actor(Action.Target);
	PatrolStart = actor(Action.PatrolStart);
	PatrolEnd = actor(Action.PatrolEnd);
	MaxFireRange = Action.MaxFireRange;
}

defaultproperties
{
	MaxFireRange = 500
	PatrolEnd = None
	PatrolStart = None
	Target = None
}