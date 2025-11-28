import React, { useState } from 'react';
import { getItemUrl, isSlotWithItem } from '../../helpers';
import useNuiEvent from '../../hooks/useNuiEvent';
import { Items } from '../../store/items';
import WeightBar from '../utils/WeightBar';
import { useAppSelector } from '../../store';
import { selectLeftInventory } from '../../store/inventory';
import { SlotWithItem } from '../../typings';
import SlideUp from '../utils/transitions/SlideUp';
import { getRarityKey, Rarity } from '../../store/rarity';

const InventoryHotbar: React.FC = () => {
  const [hotbarVisible, setHotbarVisible] = useState(false);
  const items = useAppSelector(selectLeftInventory).items.slice(0, 5);

  const slotlabels = [
    { slot: 1, label: 'Weapon Slot 1' },
    { slot: 2, label: 'Weapon Slot 2' },
    { slot: 3, label: 'Hotkey Slot 3' },
    { slot: 4, label: 'Hotkey Slot 4' },
    { slot: 5, label: 'Hotkey Slot 5' },
  ]

  // stupid fix for timeout
  const [handle, setHandle] = useState<NodeJS.Timeout>();
  useNuiEvent('toggleHotbar', () => {
    if (hotbarVisible) {
      setHotbarVisible(false);
    } else {
      if (handle) clearTimeout(handle);
      setHotbarVisible(true);
      setHandle(setTimeout(() => setHotbarVisible(false), 3000));
    }
  });

  const withAlpha = (color: string, alpha: number) => {
    return color.replace(/rgba?\(([^)]+)\)/, (match, contents) => {
      if (!contents) return match;
      const parts = contents.split(',').map((p: string) => p.trim());
      if (parts.length === 3) {
        return `rgba(${parts.join(', ')}, ${alpha})`;
      } else if (parts.length === 4) {
        return `rgba(${parts[0]}, ${parts[1]}, ${parts[2]}, ${alpha})`;
      }
      return match;
    });
  };

  return (
    <SlideUp in={hotbarVisible}>
      <div className="hotbar-container">
        {items.map((item, index) => {
          const rarityKey = getRarityKey(item?.rarity) || 'common';
          const rarityColor = Rarity[rarityKey] ?? Rarity.common;

          const slotLabel = slotlabels.find(s => s.slot === item.slot)?.label || '';

          return (
            <div
              key={`hotbar-${item.slot}`}
              className="hotbar-item-slot"
              style={{
                borderRadius: '4px',
                padding: '8px',
                border: rarityColor
                  ? '1px solid transparent'
                  : '1px dashed rgba(255,255,255,0.4)',
                background: rarityColor
                  ? `
              ${item?.name ? `url(${getItemUrl(item as SlotWithItem)}) center / 35% 35% no-repeat padding-box,` : ''}
              linear-gradient(45deg, #161616bb, #000000e0) padding-box,
              linear-gradient(-45deg, rgba(255,255,255,0.0), ${withAlpha(rarityColor, 1)}) border-box
            `
                  : `
              ${item?.name ? `url(${getItemUrl(item as SlotWithItem)}) center / 35% 35% no-repeat padding-box,` : ''}
              linear-gradient(45deg, #161616bb, #000000e0) padding-box,
              linear-gradient(135deg, rgba(255,255,255,0.336), rgba(0,0,0,0.589)) border-box
            `,
                boxShadow: rarityColor
                  ? `inset 0px 0px 40px -20px ${withAlpha(rarityColor, 0.5)}`
                  : 'inset 0px 0px 40px -10px rgba(0,0,0, 1)',
              }}
            >
              <div className="hotbar-slot-label-above">
                    {slotLabel}
              </div>

              {isSlotWithItem(item) && (
                <div className="item-slot-wrapper">
                  <div className="hotbar-slot-header-wrapper">
                    <div
                      className="inventory-slot-number"
                      style={{
                        background: rarityColor
                          ? `
                  ${withAlpha(rarityColor, 1)}
                `
                          : `
                  linear-gradient(135deg, rgba(255,255,255,0.336), rgba(0,0,0,0.589))
                `,
                      }}
                    >{item.slot}</div>
                    <div className='item-slot-header-wrapper'>
                      {item.count && item.count > 1 && (
                        <div className="item-slot-info-wrapper2">
                          <p>{item.count ? item.count.toLocaleString('en-us') + `x` : ''}</p>
                        </div>
                      )}
                    </div>
                    <div className="inventory-slot-rarity" style={{ color: rarityColor ? `${withAlpha(rarityColor, 1)}` : `linear-gradient(135deg, rgba(255,255,255,0.336), rgba(0,0,0,0.589))` }}>
                      {item.rarity || 'common'}
                    </div>
                  </div>
                  <div>
                    {item?.durability !== undefined && (
                      <WeightBar percent={item.durability} rarityColor={rarityColor || undefined} durability />
                    )}
                    <div className="inventory-slot-label-box">
                      <div className="inventory-slot-label-text">
                        {item.metadata?.label
                          ? item.metadata.label
                          : Items[item.name]?.label || item.name}
                      </div>
                      <p style={{
                        fontSize: '0.8vh',
                      }}>
                        {item.weight > 0
                          ? item.weight >= 1000
                            ? `${(item.weight / 1000).toLocaleString('en-us', {
                              minimumFractionDigits: 2,
                            })}kg `
                            : `${item.weight.toLocaleString('en-us', {
                              minimumFractionDigits: 0,
                            })}g `
                          : ''}
                      </p>
                    </div>
                  </div>
                </div>
              )}
            </div>
          );
        })}
      </div>
    </SlideUp>
  );
};

export default InventoryHotbar;
