/*******************************************************************************
* AkRevPhysicsSimulation generated by MVN.RLLib using UE Explorer.
* MVN.RLLib © 2019 Martin VN. All rights reserved.
* All rights belong to their respective owners.
*******************************************************************************/
class AkRevPhysicsSimulation extends Object;

struct native AkRevSimPhysicsControls
{
    var() private float Weight;
    var() private float EngineTorque;
    var() private float BreakingHorsePower;
    var() private array<private float> GearRatios;

    structdefaultproperties
    {
        Weight=900.0
        EngineTorque=2500.0
        BreakingHorsePower=6000.0
        GearRatios(0)=3.50
        GearRatios(1)=2.0
        GearRatios(2)=1.40
        GearRatios(3)=1.0
        GearRatios(4)=0.70
    }
};

struct native AkRevSimFrame
{
    var private float RPM;
    var private int Gear;
    var private int RevGear;
    var private float Velocity;

    structdefaultproperties
    {
        RPM=0.0
        Gear=0
        RevGear=0
        Velocity=0.0
    }
};

struct native AkRevSimUpdateParams
{
    var private float Throttle;
    var private float Brake;
    var private float EngineFrictionScale;
    var private float GroundFrictionScale;
    var private float ClutchedGearRatio;
    var private bool bEnableUpShifting;
    var private AkRevSimPhysicsControls Controls;
    var private AkRevSimFrame frame;

    structdefaultproperties
    {
        Throttle=0.0
        Brake=0.0
        EngineFrictionScale=1.0
        GroundFrictionScale=1.0
        ClutchedGearRatio=0.0
        bEnableUpShifting=true
        Controls=(Weight=900.0,EngineTorque=2500.0,BreakingHorsePower=6000.0,GearRatios=(3.50,2.0,1.40,1.0,0.70))
        frame=(RPM=0.0,Gear=0,RevGear=0,Velocity=0.0)
    }
};

var() private float EngineGearRatio;
var() private float EngineFriction;
var() private float GroundFriction;
var() private float WindResistancePerVelocity;
var() private float UpShiftingRPM;
var() private float DownShiftRPM;
var() private float InfiniteGearRatioDecreaseAmount;
var() private float ThrottleInterpolationTime;
var private transient float EngineTorque;
var private transient float BrakingForce;
var private transient float WindResistance;
var private transient float FrictionResistance;
var private transient float EngineResistance;
var private transient float NetForce;
// var private delegate<EventGearChange> __EventGearChange__Delegate;

defaultproperties
{
    EngineGearRatio=50.0
    EngineFriction=0.660
    GroundFriction=1.0
    WindResistancePerVelocity=0.0150
    UpShiftingRPM=0.970
    DownShiftRPM=0.940
    InfiniteGearRatioDecreaseAmount=0.90
    ThrottleInterpolationTime=0.050
}

// Export UAkRevPhysicsSimulation::execStep(FFrame&, void* const)
final function AkRevSimFrame Step(float DeltaTime, const out AkRevSimUpdateParams Params)
{  /*Function decompiling is disabled */ }

// Export UAkRevPhysicsSimulation::execCalcRPM(FFrame&, void* const)
final function float CalcRPM(float GearRatio, float Velocity)
{  /*Function decompiling is disabled */ }

// Export UAkRevPhysicsSimulation::execCalcVelocity(FFrame&, void* const)
final function float CalcVelocity(float GearRatio, float RPM)
{  /*Function decompiling is disabled */ }

// Export UAkRevPhysicsSimulation::execGetGearRatio(FFrame&, void* const)
static final function float GetGearRatio(const out AkRevSimUpdateParams SimUpdate)
{  /*Function decompiling is disabled */ }

// Export UAkRevPhysicsSimulation::execInterpGearRatio(FFrame&, void* const)
static final function float InterpGearRatio(const out AkRevSimUpdateParams SimUpdate, int Gear)
{  /*Function decompiling is disabled */ }

simulated function PrintDebugInfo(DebugDrawer Drawer)
{  /*Function decompiling is disabled */ }