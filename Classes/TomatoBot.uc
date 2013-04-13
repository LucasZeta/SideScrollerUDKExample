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

state Defending
{
	ignores EnemyNotVisible;

	function Restart(bool bVehicleTransition)
	{
	}

	function bool IsDefending()
	{
		return true;
	}

	function EnableBumps()
	{
		enable('NotifyBump');
	}

	event MonitoredPawnAlert()
	{
		WhatToDoNext();
	}

	function ClearPathFor(Controller C)
	{
	}

	function SetRouteGoal()
	{
		local Actor NextMoveTarget;
		local bool bCanDetour;

		bCanDetour = (Vehicle(Pawn) == None) || (UTVehicle_Hoverboard(Pawn) != None);

		if (ActorReachable(RouteGoal))
			NextMovetarget = RouteGoal;
		else
			NextMoveTarget = FindPathToward(RouteGoal, bCanDetour);

		if (NextMoveTarget == None)
		{
			NextMoveTarget = FindPathToward(RouteGoal, bCanDetour);
		}

		if (NextMoveTarget == None)
		{
			CampTime = 3;
			// No target
			GotoState('Defending', 'Pausing');
		}

		Focus = NextMoveTarget;
		MoveTarget = NextMoveTarget;
	}

	function BeginState(Name PreviousStateName)
	{
	}

	function EndState(Name NextStateName)
	{
		MonitoredPawn = None;
		SetCombatTimer();
		bShortCamp = false;
	}
	
	Begin:
	WaitForLanding();
	CampTime = bShortCamp ? 0.3 : 3.0;
	bShortCamp = false;

	SetRouteGoal();

	if (Pawn.ReachedDestination(RouteGoal))
	{
		goto('Pausing');
	}
	else
	{
		Moving:
		Pawn.bWantsToCrouch = false;

		MoveToward(MoveTarget, MoveTarget, 20, false, true);

		if (Pawn.ReachedDestination(RouteGoal))
		{
			goto('Pausing');
		}
	}

	LatentWhatToDoNext();

	Pausing:
	StopMovement();

	Pawn.bWantsToCrouch = IsSniping() && !WorldInfo.bUseConsoleInput;

	SetFocalPoint(Pawn.Location + vector(MoveTarget.Rotation) * 10.0);

	SwitchToBestWeapon();

	Sleep(0.5);

	if (UTWeapon(Pawn.Weapon) != None && UTWeapon(Pawn.Weapon).ShouldFireWithoutTarget())
	{
		Pawn.BotFire(false);
	}

	Sleep(FMax(0.1,CampTime - 0.5));

	if(RouteGoal != none && RouteGoal == PatrolEnd)
	{
		RouteGoal = PatrolStart;
	}
	else
	{
		RouteGoal = PatrolEnd;
	}

	LatentWhatToDoNext();
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