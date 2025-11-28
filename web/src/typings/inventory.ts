import { Slot } from './slot';

export enum InventoryType {
    PLAYER = 'player',
    BACKPACK = 'backpack',
    SHOP = 'shop',
    CONTAINER = 'container',
    CRAFTING = 'crafting',
    CRAFTING_STORAGE = 'crafting_storage',
}

export type Inventory = {
    id: string;
    type: string;
    slots: number;
    items: Slot[];
    maxWeight?: number;
    label?: string;
    groups?: Record<string, number>;
};
