/*******************************************************************************
* SpecialPickup_Spring_TA generated by MVN.RLLib using UE Explorer.
* MVN.RLLib ? 2019 Martin VN. All rights reserved.
* All rights belong to their respective owners.
*******************************************************************************/
class SpecialPickup_Spring_TA extends SpecialPickup_Targeted_TA
    notplaceable
    hidecategories(Navigation);

enum ESpringState
{
    SpringState_Traveling,
    SpringState_PostHit,
    SpringState_MAX
};

var() private float Force;
var() private float VerticalForce;
var() private Vector Torque;
var() private bool bApplyRelativeForce;
var() private bool bApplyConstantForce;
var() private bool bBreakConstantForceWithHit;
var() private bool bApplyRelativeConstantForce;
var() private bool bInstant;
var() private bool bFollowAfterHit;
var private bool bSpringed;
var() private InterpCurveFloat RelativeForceCurve;
var() private float RelativeForceNormalDirection;
var() private float MaxSpringLength;
var() private float ConstantForce;
var() private InterpCurveFloat RelativeConstantForceCurve;
var() private InterpCurveFloat SpringLengthCurve;
var() private Vector FromOffset;
var() private StaticMesh SpringMesh;
var() private Vector SpringMeshScale;
var() private float SpringMeshInitialSize;
var() private Rotator SpringRotationOffset;
var() private StaticMesh HittingMesh;
var() private Vector HittingMeshScale;
var() private Vector HittingMeshOffset;
var() private Rotator HittingRotationOffset;
var() private float HitDistanceOffset;
var() private float AfterSpringDuration;
var() private _Types_TA.EBallHitType BallHitType;
var() private InterpCurveFloat AfterHitLengthCurve;
var() private FXActor_TA HitFXArchetype;
var() private FXActor_TA ShootFXArchetype;
var() private AkSoundCue HitSFX;
var() private name FadeOutParam;
var() private InterpCurveFloat FadeOutCurve;
var() private float MinSpringLength;
var() private float WeldedForceScalar;
var() private float WeldedVerticalForce;
var private float CurrentSpringLength;
var private float SpringedTime;
var private export editinline transient StaticMeshComponent_TA SMC;
var private transient MaterialInstance SMI;
var private export editinline transient StaticMeshComponent_TA HMC;
var private transient array<private MaterialInstance> HMI;
var private transient float AfterSpringTime;
var private transient float SpringToTime;
var private transient Vector SpringOrigin;
var private transient Vector SpringedLocation;
var private transient Vector SpringedNormal;
var private transient float SpringedLength;
var private transient FXActor_TA ShootFX;

defaultproperties
{
    RelativeForceNormalDirection=1.0
    MaxSpringLength=99999.0
    BallHitType=EBallHitType.HitType_Item1
    MinSpringLength=30.0
    WeldedForceScalar=1.0
}