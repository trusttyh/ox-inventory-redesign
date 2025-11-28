import InventoryGrid from './InventoryGrid';
import { useAppSelector } from '../../store';
import { selectLeftInventory, selectBackpackInventory, selectRightInventory, selectCraftingInventory } from '../../store/inventory';
import React, { useMemo } from 'react';
import { isSlotWithItem } from '../../helpers';
import { AnimatePresence, motion } from 'framer-motion';

const LeftInventory: React.FC = () => {
  const leftInventory = useAppSelector(selectLeftInventory);
  const backpackInventory = useAppSelector(selectBackpackInventory);
  const rightInventory = useAppSelector(selectRightInventory);
  const craftingInventory = useAppSelector(selectCraftingInventory);

  // const displayItems = useMemo(() => leftInventory.items.slice(9), [leftInventory.items]);
  const displayItems = useMemo(() => leftInventory.items.filter(item => item.slot > 9), [leftInventory.items]);
  const backpackEquipped = useMemo(() => {
    const slotSix = leftInventory.items.find((item) => item.slot === 6);
    return Boolean(slotSix && (isSlotWithItem(slotSix) || slotSix.name));
  }, [leftInventory.items]);

  const shouldShowBackpack = backpackEquipped && (backpackInventory?.slots ?? 0) > 0;
  const shouldShowCraftingInventory = rightInventory?.type === 'crafting' && craftingInventory && (craftingInventory?.slots ?? 0) > 0;

  return (
    <div className="left-inventory">
      <AnimatePresence>
        <motion.div key="left-inventory-motion">
          <InventoryGrid
            inventory={leftInventory}
            itemsOverride={displayItems}
            collapsible
          />
          {shouldShowBackpack && (
            <div style={{ marginTop: '1vh' }}>
              <InventoryGrid
                inventory={backpackInventory}
                hideHeader={false}
                collapsible
              />
            </div>
          )}
          {shouldShowCraftingInventory && (
            <div style={{ marginTop: '1vh' }}>
              <InventoryGrid
                inventory={craftingInventory}
                hideHeader={false}
                collapsible
              />
            </div>
          )}
        </motion.div>
      </AnimatePresence>
    </div>
  );
};

export default LeftInventory;
