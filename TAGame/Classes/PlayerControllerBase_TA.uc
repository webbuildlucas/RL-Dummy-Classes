/*******************************************************************************
 * PlayerControllerBase_TA generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib © 2009-2015 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PlayerControllerBase_TA extends PlayerController_X
    native;

var() float SpectatorCameraAccel;
var transient Vector SpectatorVelXY;
var transient float SpectatorVelZ;
var() privatewrite PostProcessManager_TA PostProcessManagerArchetype;
var privatewrite transient PostProcessManager_TA PostProcessManager;
var protectedwrite transient int SpectatorPitchDir;
var protectedwrite transient int SwivelPitchDir;