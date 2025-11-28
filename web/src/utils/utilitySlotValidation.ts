export interface UtilitySlotRestriction {
  name: string;
  restrictions: {
    type: 'weapon_prefix' | 'allowed_items';
    prefix?: string;
    items?: string[];
    exclude?: boolean;
  };
  exclude_items?: string[];
}

let utilitySlotRestrictions: Record<number, UtilitySlotRestriction> = {};
/**
 * Check if an item can be placed in a specific utility slot
 * @param itemName - Name of the item to check
 * @param slot - Slot number (1-9)
 * @returns true if item can be placed, false otherwise
 */
export function canItemBePlacedInUtilitySlot(itemName: string, slot: number): boolean {
  const slotConfig = utilitySlotRestrictions[slot];

  if (!slotConfig || !slotConfig.restrictions) {
    return true;
  }

  const restrictions = slotConfig.restrictions;

  // Check for excluded items (e.g., utility items in hotkey slots)
  if (slotConfig.exclude_items && slotConfig.exclude_items.includes(itemName)) {
    return false;
  }

  if (restrictions.type === 'weapon_prefix') {
    // Check if item starts with the specified prefix
    const startsWithPrefix = itemName.startsWith(restrictions.prefix || '');
    // If exclude is true, return the opposite (allow items that DON'T start with prefix)
    const result = restrictions.exclude ? !startsWithPrefix : startsWithPrefix;
    return result;
  } else if (restrictions.type === 'allowed_items') {
    // Check if item is in the allowed list
    const result = restrictions.items?.includes(itemName) || false;
    return result;
  }

  return true; // Default to allowing if restriction type is unknown
}

/**
 * Get the restriction configuration for a utility slot
 * @param slot - Slot number (1-9)
 * @returns restriction configuration or null if no restrictions
 */
export function getUtilitySlotRestrictions(slot: number): UtilitySlotRestriction | null {
  return utilitySlotRestrictions[slot] || null;
}

/**
 * Set utility slot restrictions (called from server)
 * @param restrictions - Restrictions received from server
 */
export function setUtilitySlotRestrictions(restrictions: Record<string | number, UtilitySlotRestriction>): void {
  utilitySlotRestrictions = {};
  for (const [key, restriction] of Object.entries(restrictions)) {
    const numericKey = parseInt(key, 10);
    if (!isNaN(numericKey)) {
      utilitySlotRestrictions[numericKey] = restriction;
    }
  }
}

/**
 * Get all utility slot restrictions
 * @returns current restrictions
 */
export function getAllUtilitySlotRestrictions(): Record<number, UtilitySlotRestriction> {
  return utilitySlotRestrictions;
}

/**
 * Check if a slot is a utility slot (1-9)
 * Note: Utility slots are only valid in the left inventory
 * @param slot - Slot number to check
 * @returns true if slot is a utility slot
 */
export function isUtilitySlot(slot: number): boolean {
  return slot >= 1 && slot <= 9;
}
