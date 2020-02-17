/*******************************************************************************
* SpecialPickup_TimeBomb_TA generated by MVN.RLLib using UE Explorer.
* MVN.RLLib ? 2019 Martin VN. All rights reserved.
* All rights belong to their respective owners.
*******************************************************************************/
class SpecialPickup_TimeBomb_TA extends SpecialPickup_TA
    notplaceable
    hidecategories(Navigation);

var() private float Radius;
var() private float AlmostReadyDuration;
var() private float StartMatSpeed;
var() private float AlmostReadyMatSpeed;
var() private float ImpulseForce;
var() private float CarVerticalForce;
var() private float CarTorque;
var() private bool bDemolish;
var() private bool bImpulse;