import React, { useState, useEffect } from 'react';
import { useAppSelector } from '../../store';
import { selectLeftInventory } from '../../store/inventory';
import InventorySlot from './InventorySlot';
import { Backpack, Phone, Parachute, BodyArmor, Pistol } from '../utils/icons/IconDefinitions';
import { isSlotWithItem } from '../../helpers';
import { fetchNui } from '../../utils/fetchNui';
import { isEnvBrowser } from '../../utils/misc';

type IconComponent = React.ComponentType<any> | null;

type SlotConfig = {
    slot: number;
    Icon?: IconComponent;
    label?: string;
    showPhoneKey?: boolean;
};

const leftSlotConfigs: SlotConfig[] = [
    { slot: 6, Icon: Backpack, label: 'Backpack' },
    { slot: 7, Icon: BodyArmor, label: 'Body Armor' },
    { slot: 8, Icon: Phone, label: 'Phone', showPhoneKey: true },
];

const rightSlotConfigs: SlotConfig[] = [
    { slot: 9, Icon: Parachute, label: 'Parachute' },
    { slot: 1, Icon: Pistol, label: 'Weapon Slot' },
    { slot: 2, Icon: Pistol, label: 'Weapon Slot' },
];

const middleSlotConfigs: SlotConfig[] = [
    { slot: 3, label: 'Hotkey Slot 3' },
    { slot: 4, label: 'Hotkey Slot 4' },
    { slot: 5, label: 'Hotkey Slot 5' },
];

const InventoryUtils = () => {
    const { items, id, type, groups } = useAppSelector(selectLeftInventory);
    const [phoneKey, setPhoneKey] = useState<string>('M');

    useEffect(() => {
        const fetchPhoneKey = async () => {
            if (isEnvBrowser()) {
                setPhoneKey('M');
                return;
            }

            try {
                const key = await fetchNui<string>('getPhoneKey');
                setPhoneKey(key);
            } catch (error) {
                console.error('Failed to fetch phone key:', error);
                setPhoneKey('M');
            }
        };

        fetchPhoneKey();
    }, []);


    const renderSlot = ({ slot, Icon, label, showPhoneKey }: SlotConfig) => {
        const slotItem = items.find((item) => item.slot === slot) || { slot };
        const hasItem = isSlotWithItem(slotItem);
        const isPhoneSlot = showPhoneKey && hasItem && slot === 8;

        return (
            <div className="utility-slot-group" key={`utility-slot-${slot}`}>
                {label && <div className="utility-slot-label">{label}</div>}
                <div className="utility-slot-wrapper">
                    {isPhoneSlot && (
                        <div className="inventory-slot-number" style={{ top: 0.2, left: 0.6 }}>
                            {phoneKey}
                        </div>
                    )}
                    <InventorySlot
                        item={slotItem}
                        inventoryType={type}
                        displayInventoryType="utility"
                        inventoryGroups={groups}
                        inventoryId={id}
                        style={
                            hasItem
                                ? undefined
                                : {
                                    boxShadow: `rgb(0, 0, 0) 0px 0px 2vh -1vh inset`,
                                    border: `1px solid transparent`,
                                    background:
                                        'linear-gradient(45deg, rgba(22, 22, 22, 0.733), rgba(0, 0, 0, 0.706)) padding-box, linear-gradient(135deg, rgba(255, 255, 255, 0.337), rgba(0, 0, 0, 0.59)) border-box',
                                }
                        }
                    />
                    {!hasItem && Icon && (
                        <div className="utility-slot-icon">
                            <Icon />
                        </div>
                    )}
                </div>
            </div>
        );
    };
    
    return (
        <div className="utils-inventory" style={{position: 'relative', display: 'flex', justifyContent: 'space-between', width: '47vh', height: '50vh'}}>
            <div className="utils-left-grid" style={{ position: 'absolute', left: '-1vw', zIndex: 5 }}>
                {leftSlotConfigs.map(renderSlot)}
            </div>
                
            <div style={{position: 'absolute', width: '100%', height: '100%',display: 'flex', justifyContent: 'center'}}>
                <div className="man-svg" style={{width: '25vh', height: '40vh', display: 'flex', justifyContent: 'center', alignItems: 'center', zIndex: 1 }}>
                    <img style={{height: '90%', filter: 'drop-shadow(0px 0px 20px rgb(162, 202, 49))'}} src="https://files.fivemerr.com/images/af3633fe-ce18-4bb9-b7f5-a31c45163945.svg" />
                </div>
            </div>

            <div className="utils-right-grid" style={{ position: 'absolute', right: '-1vw', zIndex: 5 }}>
                {rightSlotConfigs.map(renderSlot)}
            </div>

            <div className="utils-middle-grid" style={{ position: 'absolute', bottom: '-1.7vw', zIndex: 5 }}>
                {middleSlotConfigs.map(renderSlot)}
            </div>
        </div>
    );
};

export default InventoryUtils;
