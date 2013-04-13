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

state ChargingNoStrafe extends Charging
{
	function bool StrafeFromDamage(float Damage, class<DamageType> DamageType, bool bFindDest)
	{
		return false;
	}

	function bool TryStrafe(vector sideDir)
	{
		return false;
	}
}

defaultproperties
{
	MaxFireRange = 500
	PatrolEnd = None
	PatrolStart = None
	Target = None
}