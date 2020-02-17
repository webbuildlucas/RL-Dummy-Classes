/*******************************************************************************
* SpecialPickup_BallFreeze_TA generated by MVN.RLLib using UE Explorer.
* MVN.RLLib ? 2019 Martin VN. All rights reserved.
* All rights belong to their respective owners.
*******************************************************************************/
class SpecialPickup_BallFreeze_TA extends SpecialPickup_Targeted_TA
    notplaceable
    hidecategories(Navigation);

enum BallFreezeState
{
    BallFreezeState_Freezing,
    BallFreezeState_Frozen,
    BallFreezeState_MAX
};

var() private FXActor_X FreezeBreakFXArchetype;
var() private FXActor_X FreezeFXArchetype;
var() private MaterialInstanceConstant FreezeMIC;
var() private name FreezeMaterialParam;
var() private InterpCurveFloat FreezeInterpTime;
var() private bool bMaintainMomentum;
var private transient bool bTouched;
var() private float TimeToStop;
var() private float StopMomentumPercentage;
var() private AkSoundCue FreezeSFX;
var() private AkSoundCue BreakSFX;
var private export editinline transient StaticMeshComponent CopiedBallMesh;
var private transient Ball_TA Ball;
var private transient Vector OrigLinearVelocity;
var private transient Vector OrigAngularVelocity;
var private transient float OrigSpeed;
var private transient float RepOrigSpeed;
var private transient MaterialInstanceConstant FreezeMat;
var private transient FXActor_X FreezeFX;

defaultproperties
{
    bCanTargetBall=true
}