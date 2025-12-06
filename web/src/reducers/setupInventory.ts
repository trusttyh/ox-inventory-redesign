import { CaseReducer, PayloadAction } from '@reduxjs/toolkit';
import { getItemData, itemDurability } from '../helpers';
import { Items } from '../store/items';
import { Inventory, State } from '../typings';

export const setupInventoryReducer: CaseReducer<
  State,
  PayloadAction<{
    leftInventory?: Inventory;
    rightInventory?: Inventory;
    backpackInventory?: Inventory;
    craftingInventory?: Inventory;
    shouldReset?: boolean;
  }>
> = (state, action) => {
  const { leftInventory, rightInventory, shouldReset } = action.payload;
  const curTime = Math.floor(Date.now() / 1000);

  if (shouldReset) {
    state.rightInventory = { id: '', type: '', slots: 0, maxWeight: 0, items: [] };
    state.containerInventory = undefined;
    state.craftingInventory = undefined;
  }

  if (leftInventory)
    state.leftInventory = {
      ...leftInventory,
      items: Array.from(Array(leftInventory.slots + 9), (_, index) => {
        const itemsArray = leftInventory.items ? Object.values(leftInventory.items) : [];
        const rawItem = itemsArray.find((i) => i?.slot === index + 1) || {
          slot: index + 1,
        };

        if (!rawItem.name) return rawItem;

        if (typeof Items[rawItem.name] === 'undefined') {
          getItemData(rawItem.name);
        }

        return {
          ...rawItem,
          durability: itemDurability(rawItem.metadata, curTime),
        };
      }),
    };

  if (action.payload.backpackInventory !== undefined) {
    const backpackInventory = action.payload.backpackInventory;

    if (backpackInventory && backpackInventory.slots > 0) {

      const itemsBySlot: Record<number, any> = {};
      const itemsArray = backpackInventory.items ? Object.values(backpackInventory.items) : [];
      for (const item of itemsArray) {
        if (item?.slot) itemsBySlot[item.slot] = item;
      }

      state.backpackInventory = {
        ...backpackInventory,
        items: Array.from({ length: backpackInventory.slots }, (_, i) => {
          const slot = i + 1;
          const rawItem = itemsBySlot[slot] || { slot };

          if (!rawItem.name) return rawItem;

          return {
            ...rawItem,
            durability: itemDurability(rawItem.metadata, curTime),
          };
        }),
      };

    } else {
      state.backpackInventory = { id: '', type: '', slots: 0, maxWeight: 0, items: [] };
    }
  }

  if (action.payload.craftingInventory !== undefined) {
    const craftingInventory = action.payload.craftingInventory;

    if (craftingInventory && craftingInventory.slots > 0) {
      const itemsBySlot: Record<number, any> = {};
      const itemsArray = craftingInventory.items ? Object.values(craftingInventory.items) : [];
      for (const item of itemsArray) {
        if (item?.slot) itemsBySlot[item.slot] = item;
      }

      state.craftingInventory = {
        ...craftingInventory,
        items: Array.from({ length: craftingInventory.slots }, (_, i) => {
          const slot = i + 1;
          const rawItem = itemsBySlot[slot] || { slot };

          if (!rawItem.name) return rawItem;

          if (typeof Items[rawItem.name] === 'undefined') {
            getItemData(rawItem.name);
          }

          return {
            ...rawItem,
            durability: itemDurability(rawItem.metadata, curTime),
          };
        }),
      };
    } else {
      state.craftingInventory = undefined;
    }
  }

  if (rightInventory) {
    const processedInventory = rightInventory.type === 'crafting' ? {
      ...rightInventory,
      items: rightInventory.items || [],
    } : {
      ...rightInventory,
      items: Array.from(Array(
        rightInventory.type === 'shop' 
          ? (() => {
              const itemsArray = rightInventory.items ? Object.values(rightInventory.items) : [];
              const maxSlot = itemsArray.reduce((max, item) => 
                item?.slot && item?.name ? Math.max(max, item.slot) : max, 
                0
              );
              return Math.max(maxSlot, rightInventory.slots);
            })()
          : rightInventory.slots
      ), (_, index) => {
        const itemsArray = rightInventory.items ? Object.values(rightInventory.items) : [];
        const rawItem = itemsArray.find((i) => i?.slot === index + 1) || {
          slot: index + 1,
        };

        if (!rawItem.name) return rawItem;

        if (typeof Items[rawItem.name] === 'undefined') {
          getItemData(rawItem.name);
        }

        return {
          ...rawItem,
          durability: itemDurability(rawItem.metadata, curTime),
        };
      }),
    };

    if (rightInventory.type === 'container') {
      state.containerInventory = processedInventory;
    } else {
      state.rightInventory = processedInventory;
    }
  }

  state.shiftPressed = false;
  state.isBusy = false;
};
