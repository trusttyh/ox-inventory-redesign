import React, { useState, useRef, useEffect } from "react";
import { motion } from "framer-motion";
import { SlotWithItem, InventoryType, DropTarget, ItemData } from "../../typings";
import { onDrop } from "../../dnd/onDrop";
import { useAppDispatch } from "../../store";
import { setItemAmount } from "../../store/inventory";
import { store } from "../../store";
import { findAvailableSlot, getItemData } from "../../helpers";
import { Items } from "../../store/items";
import { isUtilitySlot } from "../../utils/utilitySlotValidation";
import { isEqual } from "lodash";

interface SplitControlProps {
  item: SlotWithItem;
  amount: number;
  inventoryType?: string | null;
  infoVisible: boolean;
  setInfoVisible: (visible: boolean) => void;
  onCancel?: () => void;
}

const SplitControl: React.FC<SplitControlProps> = ({ item, amount, inventoryType, setInfoVisible, onCancel }) => {
  const [splitAmount, setSplitAmount] = useState(amount);
  const [isDragging, setIsDragging] = useState(false);
  const sliderRef = useRef<HTMLDivElement>(null);
  const dispatch = useAppDispatch();

  const handleSliderClick = (e: React.MouseEvent<HTMLDivElement>) => {
    if (!sliderRef.current) return;
    
    const rect = sliderRef.current.getBoundingClientRect();
    const percent = Math.max(0, Math.min(1, (e.clientX - rect.left) / rect.width));
    const newAmount = Math.max(1, Math.min(amount, Math.floor(percent * amount)));
    setSplitAmount(newAmount);
  };

  useEffect(() => {
    const handleMouseMove = (e: MouseEvent) => {
      if (!isDragging || !sliderRef.current) return;
      
      const rect = sliderRef.current.getBoundingClientRect();
      const percent = Math.max(0, Math.min(1, (e.clientX - rect.left) / rect.width));
      const newAmount = Math.max(1, Math.min(amount, Math.floor(percent * amount)));
      setSplitAmount(newAmount);
    };

    const handleMouseUp = () => {
      setIsDragging(false);
    };

    if (isDragging) {
      document.addEventListener('mousemove', handleMouseMove);
      document.addEventListener('mouseup', handleMouseUp);
    }

    return () => {
      document.removeEventListener('mousemove', handleMouseMove);
      document.removeEventListener('mouseup', handleMouseUp);
    };
  }, [isDragging, amount]);
  
  const handleCancel = () => {
    if (typeof onCancel === 'function') {
      onCancel();
    } else {
      setInfoVisible(false);
    }
  };

  const handleSplit = () => {
    // Terrible way to do this shit but I don't really give a fuck and it works, lol. --- All this does is allows you to split items properly. ---
    if (!item || splitAmount <= 0 || splitAmount >= amount) return;

    const sourceInventoryType = inventoryType === 'backpack' ? InventoryType.BACKPACK : inventoryType === 'container' ? InventoryType.CONTAINER : InventoryType.PLAYER;

    const source = { inventory: sourceInventoryType, item };

    dispatch(setItemAmount(splitAmount));

    if (sourceInventoryType === InventoryType.PLAYER) {
      const state = store.getState();

      const itemName = item.name;
      const exact = Items[itemName];
      const normalized = exact || Items[itemName.toLowerCase()] || Items[itemName.toUpperCase()];

      const stackValue = typeof item.metadata?.stack === 'boolean' ? item.metadata.stack : (item.count ?? 1) > 1;

      const sourceData: ItemData = normalized ? { ...normalized, stack: stackValue } : {
        name: itemName,
        label: item.metadata?.label || itemName,
        stack: stackValue,
        usable: false,
        close: false,
        count: item.count ?? 1,
        description: item.metadata?.description,
        image: item.metadata?.image,
      };
    
      const availableItems = state.inventory.leftInventory.items.filter(slot => slot.slot !== item.slot);
      const nonUtilityItems = availableItems.filter((target) => !isUtilitySlot(target.slot));

      let targetSlot = nonUtilityItems.find((target) => target.name === undefined);
    
      if (!targetSlot && sourceData.stack) {
        const stackableSlot = nonUtilityItems.find((target) => target.name === item.name && isEqual(target.metadata, item.metadata));
        targetSlot = stackableSlot;
      }
    
      if (targetSlot && targetSlot.slot !== item.slot) {
        onDrop(source, { inventory: InventoryType.PLAYER, item: { slot: targetSlot.slot } });
      } else {
        dispatch(setItemAmount(0));
        return;
      }
      // Copy and pasted for logic above. ||| OMG YOU COPY AND PASTED ||| --- Shut the fuck up. It works and you're using it loser --- 
    } else if (sourceInventoryType === InventoryType.BACKPACK) {
      const state = store.getState();
    
      if (!state.inventory.backpackInventory || !state.inventory.backpackInventory.items) {
        dispatch(setItemAmount(0));
        return;
      }
    
      const itemName = item.name;
      const exact = Items[itemName];
      const normalized = exact || Items[itemName.toLowerCase()] || Items[itemName.toUpperCase()];

      const stackValue = typeof item.metadata?.stack === 'boolean' ? item.metadata.stack : (item.count ?? 1) > 1;

      const sourceData: ItemData = normalized ? { ...normalized, stack: stackValue } : {
        name: itemName,
        label: item.metadata?.label || itemName,
        stack: stackValue,
        usable: false,
        close: false,
        count: item.count ?? 1,
        description: item.metadata?.description,
        image: item.metadata?.image,
      };

      const availableItems = state.inventory.backpackInventory.items.filter(slot => slot.slot !== item.slot);
    
      let targetSlot = availableItems.find((target) => target.name === undefined);

      if (!targetSlot && sourceData.stack) {
        const stackableSlot = availableItems.find((target) => target.name === item.name && isEqual(target.metadata, item.metadata));
        targetSlot = stackableSlot;
      }

      if (targetSlot && targetSlot.slot !== item.slot) {
        onDrop(source, { inventory: InventoryType.BACKPACK, item: { slot: targetSlot.slot } });
      } else {
        dispatch(setItemAmount(0));
        return;
      }
    } else {
      onDrop(source, undefined);
    }

    dispatch(setItemAmount(0));

    handleCancel();

    setInfoVisible(false);
  };


  return (
    <motion.div
      initial={{ y: 0, opacity: 0 }}
      animate={{ y: 0, opacity: 1 }}
      exit={{ y: 0, opacity: 0 }}
      transition={{ duration: 0.4, ease: 'easeOut' }}>
        <div 
        className="inventory-grid-wrapper"
        style={{
          background: 'rgba(30, 30, 30, 0.75)',
          display: "flex",
          alignItems: "center",
          padding: "20px",
          position: "relative",
          width: "20vh",
        }}
        >
          <h1 style={{ position: 'relative', textAlign: 'center' }}>Split</h1>

          <h1 style={{ textAlign: 'center', fontSize: "1.5vh" }}>Item Quanity</h1>
            <input
              type="number"
              value={splitAmount}
              min={1}
              max={amount}
              onChange={(e) => {
                const value = Number(e.target.value);
                if (!isNaN(value)) {
                  setSplitAmount(Math.max(1, Math.min(amount, value)));
                }
              }}
              style={{
                width: "75%",
                textAlign: "center",
                fontSize: "1.25vh",
                fontWeight: "600",
                fontFamily: 'Geist, sans-serif',
                border: "1px solid #7e7e7e5b"
              }}
            />

          {/* Framer Motion slider */}
          <motion.div
            ref={sliderRef}
            onClick={handleSliderClick}
            style={{
              width: "100%",
              height: "5px",
              background: "#3A9070",
              borderRadius: "4px",
              position: "relative",
              marginTop: "20px",
              marginBottom: "20px",
              pointerEvents: "auto",
            }}
          >
            <motion.div
              style={{
                height: "100%",
                width: `${(splitAmount / amount) * 100}%`,
                maxWidth: "100%",
                background: "#77deb9",
                borderRadius: "4px",
                pointerEvents: "none",
              }}
              animate={{ width: `${(splitAmount / amount) * 100}%` }}
              transition={{ type: "tween", ease: "linear", duration: 0.15 }}
            />

            <motion.div
              onMouseDown={() => setIsDragging(true)}
              style={{
                position: "absolute",
                top: "50%",
                left: `${(splitAmount / amount) * 100}%`,
                transform: "translate(-50%, -50%)",
                width: "17px",
                height: "17px",
                background: "#77deb9",
                borderRadius: "50%",
                boxShadow: "0 0 8px rgba(119, 222, 185, 0.6)",
                pointerEvents: "auto",
              }}
              animate={{ left: `${(splitAmount / amount) * 100}%` }}
              transition={{ type: "tween", ease: "linear", duration: 0.15 }}
            />
          </motion.div>

          {/* Fraction buttons */}
          <div style={{ gap: '10px', display: "flex", justifyContent: "space-between", marginBottom: "20px" }}>
            {[1 / 2, 1 / 3, 1 / 4].map((fraction) => (
              <button
              className="split-button"
                key={fraction}
                style={{
                  fontSize: "1.5vh",
                  fontWeight: "600",
                  flex: 1,
                  margin: "0 5px",
                  padding: "12px 12px",
                  cursor: "pointer",
                }}
                onClick={() => setSplitAmount(Math.max(1, Math.floor(amount * fraction)))}
              >
                1/{1 / fraction}
              </button>
            ))}
          </div>

          {/* Action buttons */}
          <div style={{ width: '100%', gap: '10px', display: "flex", justifyContent: "space-between" }}>
            <button className="split-button" onClick={handleSplit}>
              Split
            </button>

            <button className="split-button" onClick={handleCancel}>
              Cancel
            </button>
          </div>
        </div>
    </motion.div>
  );
};

export default SplitControl;
