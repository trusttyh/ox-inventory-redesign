import React, { useState } from 'react';
import useNuiEvent from '../../hooks/useNuiEvent';
import { useAppDispatch } from '../../store';
import { refreshSlots, setAdditionalMetadata, setupInventory } from '../../store/inventory';
import { useExitListener } from '../../hooks/useExitListener';
import type { Inventory as InventoryProps } from '../../typings';
import RightInventory from './RightInventory';
import LeftInventory from './LeftInventory';
import Tooltip from '../utils/Tooltip';
import { closeTooltip } from '../../store/tooltip';
import InventoryContext from './InventoryContext';
import { closeContextMenu } from '../../store/contextMenu';
import Fade from '../utils/transitions/Fade';
import InventoryHotbar from './InventoryHotbar';
import InventoryPanelSwitcher from './InventoryPanelSwitcher';
import InventoryUtils from './InventoryUtils';
import SplitControl from './SplitControl';
import InventoryContainer from './InventoryContainer';
import { AnimatePresence } from 'framer-motion';

const Inventory: React.FC = () => {
  const [inventoryVisible, setInventoryVisible] = useState(false);
  const [infoVisible, setInfoVisible] = useState(false);
  const [splitItem, setSplitItem] = useState<{ item: any; amount: number; inventoryType?: string | null } | null>(null);
  const [activePanel, setActivePanel] = useState<'utils' | 'inventory'>('inventory');
  const dispatch = useAppDispatch();

  useNuiEvent<boolean>('setInventoryVisible', setInventoryVisible);
  useNuiEvent<false>('closeInventory', () => {
    setInventoryVisible(false);
    dispatch(closeContextMenu());
    dispatch(closeTooltip());
  });
  useExitListener(setInventoryVisible);

  useNuiEvent<{ leftInventory?: InventoryProps; rightInventory?: InventoryProps }>(
    'setupInventory',
    (data) => {
      dispatch(
        setupInventory({
          ...data,
          shouldReset: !!data.leftInventory && data.rightInventory?.type !== 'container',
        })
      );
      !inventoryVisible && setInventoryVisible(true);
    }
  );

  useNuiEvent('refreshSlots', (data) => {
    dispatch(refreshSlots(data));
  });
  useNuiEvent('displayMetadata', (data: Array<{ metadata: string; value: string }>) =>
    dispatch(setAdditionalMetadata(data))
  );

  return (
    <>
      <Fade in={inventoryVisible}>
        <div className="inventory-wrapper">
          <InventoryPanelSwitcher activePanel={activePanel} setActivePanel={setActivePanel} />

          <LeftInventory />

          <AnimatePresence>
            {splitItem && (
              <SplitControl
                item={splitItem.item}
                amount={splitItem.amount}
                inventoryType={splitItem.inventoryType}
                infoVisible={infoVisible}
                setInfoVisible={setInfoVisible}
                onCancel={() => setSplitItem(null)}
              />
            )}
          </AnimatePresence>

          {activePanel === 'utils' && <InventoryUtils />}
          {activePanel === 'inventory' && (
            <div style={{ display: 'flex', flexDirection: 'column', gap: '1vh', alignItems: 'center' }}>
              <RightInventory />
              <InventoryContainer />
            </div>
          )}

          <Tooltip />
          <InventoryContext setSplitItem={setSplitItem} />
        </div>
      </Fade>
      <InventoryHotbar />
    </>
  );
};

export default Inventory;
