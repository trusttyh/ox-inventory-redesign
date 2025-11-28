import React from 'react';
import InventoryGrid from './InventoryGrid';
import { useAppSelector } from '../../store';
import { selectContainerInventory } from '../../store/inventory';
import { motion, AnimatePresence } from 'framer-motion';

const InventoryContainer: React.FC = () => {
    const InventoryContainer = useAppSelector(selectContainerInventory);

    if (!InventoryContainer) return null;

    return (
        <div className="right-inventory container-inventory">
            <AnimatePresence>
                <div key={InventoryContainer.type} className="inventory-item">
                    <motion.div>
                        <InventoryGrid
                            inventory={InventoryContainer}
                            hideExtras={false}
                            noWrapper={false}
                            collapsible
                        />
                    </motion.div>
                </div>
            </AnimatePresence>
        </div>
    );
};

export default InventoryContainer;
