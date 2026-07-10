#ifndef POKEHEARTGOLD_FIELD_FIELD_SPRITE_MANAGER_H
#define POKEHEARTGOLD_FIELD_FIELD_SPRITE_MANAGER_H

#include "sprite.h"
#include "sprite_system.h"
#include "unk_02009D48.h"

/// \struct FieldSpriteManager
/// \brief An alternate implementation of \ref SpriteManager, specifically used for field subsystems
typedef struct FieldSpriteManager {
    /// \brief 2D sprite list associated with this renderer
    SpriteList *spriteList;
    /// \brief G2dRenderer instance
    G2dRenderer renderer;
    /// \brief %Sprite resource header list. Only populated if this instance owns the resources.
    SpriteResourceHeaderList *spriteResourceHeaderList;
    /// \brief Resource managers, one for each resource type
    GF_2DGfxResMan *spriteResManagers[GF_GFX_RES_TYPE_MAX];
    /// \brief Resource object lists, one for each resource type
    GF_2DGfxResObjList *spriteResObjLists[GF_GFX_RES_TYPE_MAX];
    /// \brief Number of resource types. 6 if the resource includes multicells and multianimations, 4 otherwise.
    u16 numResMans;
    /// \brief Heap ID with which to allocate further resources
    u16 heapID;
} FieldSpriteManager;

// With these functions, the SpriteResourceHeaderList is owned by the FieldSpriteManager.

/// \brief Initialize from a fixed set of resources specified in \a resDatIdxs. This instance owns the resdat.
/// \public \memberof FieldSpriteManager
/// \param fieldSpriteManager this
/// \param resDatIdxs An array of resource IDs to load from data/resdat.narc, in the order CHAR PLTT CELL ANIM MCEL MANM DEFS.
/// \param numSprites Number of sprites (resources)
/// \param heapID ID of the heap from which to allocate sprites and resource managers
void FieldSpriteManager_InitWithResDat(FieldSpriteManager *fieldSpriteManager, const ResdatIdList *resDatIdxs, int numSprites, enum HeapID heapID);

/// \brief Release the \ref FieldSpriteManager. It should have been initialized by \ref FieldSpriteManager_InitWithResDat.
/// \public \memberof FieldSpriteManager
/// \param fieldSpriteManager this
void FieldSpriteManager_ReleaseWithResDat(FieldSpriteManager *fieldSpriteManager);

/// \brief Using the \ref FieldSpriteManager and its associated resources, create a \ref Sprite and return its pointer
/// \public \memberof FieldSpriteManager
/// \param fieldSpriteManager this
/// \param unmanagedSpriteTemplate The parameters for creating this sprite
Sprite *FieldSpriteManager_CreateSprite(FieldSpriteManager *fieldSpriteManager, const UnmanagedSpriteTemplate *unmanagedSpriteTemplate);

// With these functions, a new SpriteResourceHeaderList is created to accompany each sprite.

/// \brief Initialize without predetermined resources. This instance does not own the resdat.
/// \public \memberof FieldSpriteManager
/// \param fieldSpriteManager this
/// \param resDatCounts Number of each type of sprite resource to allocate
/// \param numSprites Number of sprites (resources)
/// \param heapId ID of the heap from which to allocate sprites and resource managers
void FieldSpriteManager_InitEmptyResLists(FieldSpriteManager *fieldSpriteManager, const SpriteResourceCountsListUnion *resDatCounts, int numSprites, enum HeapID heapId);

/// \brief Loads a PLTT resource from NARC into memory
/// \public \memberof FieldSpriteManager
/// \param fieldSpriteManager this
/// \param narcId ID of the NARC
/// \param fileId File ID within the NARC
/// \param compressed TRUE if the PLTT is LZ78-compressed, FALSE otherwise
/// \param plttNum Palette slot to load into
/// \param vramType Whether the palette should be loaded into video engine A (main) or B (sub)
/// \param resId Resource ID to bind this palette to
void FieldSpriteManager_AddPlttRes(FieldSpriteManager *fieldSpriteManager, NarcId narcId, int fileId, BOOL compressed, int plttNum, NNS_G2D_VRAM_TYPE vramType, int resId);

/// \brief Load a CELL resource from NARC into memory
/// \public \memberof FieldSpriteManager
/// \param fieldSpriteManager this
/// \param narcId ID of the NARC
/// \param fileId File ID within the NARC
/// \param compressed TRUE if the CELL is LZ78-compressed, FALSE otherwise
/// \param resId Resource ID to bind this cell to
void FieldSpriteManager_AddCellRes(FieldSpriteManager *fieldSpriteManager, NarcId narcId, int fileId, BOOL compressed, int resId);

/// \brief Load an ANIM resource from NARC into memory
/// \public \memberof FieldSpriteManager
/// \param fieldSpriteManager this
/// \param narcId ID of the NARC
/// \param fileId File ID within the NARC
/// \param compressed TRUE if the ANIM is LZ78-compressed, FALSE otherwise
/// \param resId Resource ID to bind this animation to
void FieldSpriteManager_AddAnimRes(FieldSpriteManager *fieldSpriteManager, NarcId narcId, int fileId, BOOL compressed, int resId);

/// \brief Loads a CHAR resource from NARC into memory
/// \public \memberof FieldSpriteManager
/// \param fieldSpriteManager this
/// \param narcId ID of the NARC
/// \param fileId File ID within the NARC
/// \param compressed TRUE if the CHAR is LZ78-compressed, FALSE otherwise
/// \param vramType Whether the tile data should be loaded into video engine A (main) or B (sub)
/// \param resId Resource ID to bind this tile data to
void FieldSpriteManager_AddCharRes(FieldSpriteManager *fieldSpriteManager, NarcId narcId, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vramType, int resId);

/// \brief Using the resources loaded into this instance, create a ManagedSprite
/// \public \memberof FieldSpriteManager
/// \param fieldSpriteManager this
/// \param managedSpriteTemplate The parameters for creating this sprite
ManagedSprite *FieldSpriteManager_CreateManagedSprite(FieldSpriteManager *fieldSpriteManager, const ManagedSpriteTemplate *managedSpriteTemplate);

/// \brief Release the \ref FieldSpriteManager. It should have been initialized by \ref FieldSpriteManager_InitEmptyResLists.
/// \public \memberof FieldSpriteManager
/// \param fieldSpriteManager this
void FieldSpriteManager_ReleaseWithoutResDat(FieldSpriteManager *fieldSpriteManager);

#endif // POKEHEARTGOLD_FIELD_FIELD_SPRITE_MANAGER_H
