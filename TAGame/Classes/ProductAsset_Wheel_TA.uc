/*******************************************************************************
 * ProductAsset_Bot_TA generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib © 2009-2015 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ProductAsset_Wheel_TA extends ProductAsset_TA
    editinlinenew;

const MeshRadius = 15.0f;
const MeshWidth = 15.0f;

enum EMeshMirrorMode
{
    MeshMirrorMode_Mirror,
    MeshMirrorMode_Rotate,
    MeshMirrorMode_MAX
};

var() ProductAsset_Wheel_TA.EMeshMirrorMode MirrorMode;
var() StaticMesh StaticMesh<RebuildThumbnail=>;
var() SkeletalMesh SkeletalMesh<RebuildThumbnail=>;
var() AnimTree AnimTree;
/** Mesh to use as collision when the car explodes */
var() StaticMesh CollisionMesh;
var() editinline array<editinline AttachmentBehavior_TA> Behaviors;