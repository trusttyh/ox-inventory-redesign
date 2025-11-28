import React, { useEffect, useMemo, useRef, useState } from 'react';
import InventoryGrid from './InventoryGrid';
import { useAppSelector } from '../../store';
import { selectRightInventory, selectCraftingInventory } from '../../store/inventory';
import { InventoryType, DragSource } from '../../typings';
import { useDrop } from 'react-dnd';
import { getItemUrl, getItemData } from '../../helpers';
import { motion, AnimatePresence } from 'framer-motion';
import { fetchNui } from '../../utils/fetchNui';
import { toAsciiLower } from '../../utils/string';
import dragSound from '../../assets/sounds/drag.ogg';
import { Items } from '../../store/items';
import { useNuiEvent } from '../../hooks/useNuiEvent';

import CircularProgress from './ProgressCircle';

interface ShopItem {
    slot: number;
    name: string;
    price?: number;
    metadata?: { label?: string };
    image?: string;
    currency?: string;
    weight?: number;
}

interface CartItem {
    itemKey: string;
    name: string;
    price: number;
    quantity: number;
    image?: string;
}

interface Ingredient {
    label: string;
    qty: number;
}

interface BackendCraftingRecipe {
    name: string;
    label?: string;
    ingredients: Record<string, number>;
    duration: number;
    count: number | [number, number];
    slot?: number;
    weight?: number;
}

interface CraftingRecipe {
    name: string;
    label: string;
    ingredients: Record<string, Ingredient>;
    duration: number;
    count: number;
}

interface CraftingQueueItem {
    recipe: CraftingRecipe;
    quantity: number;
}

const RightInventory: React.FC = () => {
    const rightInventory = useAppSelector(selectRightInventory);
    const craftingInventory = useAppSelector(selectCraftingInventory);
    const [cart, setCart] = useState<CartItem[]>([]);
    const [craftingRecipes, setCraftingRecipes] = useState<CraftingRecipe[]>([]);
    const [selectedRecipe, setSelectedRecipe] = useState<CraftingRecipe | null>(null);
    const [craftingInProgress, setCraftingInProgress] = useState(false);
    const [currentCraftProgress, setCurrentCraftProgress] = useState(0);
    const progressIntervalRef = useRef<number | null>(null);
    const craftTimeoutRef = useRef<number | null>(null);
    const cancelledRef = useRef(false);


    const progress = useMemo(() => Math.min(currentCraftProgress / 100, 1), [currentCraftProgress]);

    const [recipeQuantity, setRecipeQuantity] = useState<number>(1);
    const [craftQueue, setCraftQueue] = useState<CraftingQueueItem[]>([]);
    const totalCost = cart.reduce((sum, i) => sum + i.price * i.quantity, 0);
    const itemTotalsRef = useRef<Record<string, number>>({});
    const previousTotalRef = useRef(totalCost);
    const [animatedTotal, setAnimatedTotal] = useState(0);

    useEffect(() => {
        if (rightInventory?.type !== "crafting" || !Array.isArray(rightInventory.items)) {
            setCraftingRecipes([]);
            return;
        }

        const backendRecipes = rightInventory.items as BackendCraftingRecipe[];
        const itemsToFetch = new Set<string>();
        for (const recipe of backendRecipes) {
            if (!recipe) continue;

            if (recipe.name) itemsToFetch.add(recipe.name);

            if (recipe.ingredients && typeof recipe.ingredients === "object") {
                for (const itemName of Object.keys(recipe.ingredients)) {
                    if (itemName) itemsToFetch.add(itemName);
                }
            }
        }

        const missingItems = [...itemsToFetch].filter((itemName) => !Items[itemName]);

        const fetchMissingItems = async () => {
            if (missingItems.length === 0) return;

            await Promise.all(missingItems.map((item) => getItemData(item)));
        };

        const transformRecipes = () => {
            return backendRecipes.filter((r) => r?.name && r?.ingredients).map((recipe) => {
                const ingredients: Record<string, Ingredient> = {};
                
                for (const [itemName, qty] of Object.entries(recipe.ingredients ?? {})) {
                    if (!itemName || typeof qty !== "number") continue;
                    
                    const item = Items[itemName];
                    
                    ingredients[itemName] = {
                        label: item?.label ?? itemName, qty };
                }
                
                const itemInfo = Items[recipe.name];
                
                return {
                    name: recipe.name,
                    label: recipe.label ?? itemInfo?.label ?? recipe.name,
                    ingredients,
                    duration: recipe.duration ?? 0,
                    count: typeof recipe.count === "number" ? recipe.count : Array.isArray(recipe.count) ? recipe.count[0] : 1
                };
            });
        };

        fetchMissingItems().then(() => {
            setCraftingRecipes(transformRecipes());
        });
    }, [rightInventory?.id, rightInventory?.type]);

    useEffect(() => {
        let start: any = null;
        let animationFrameId: number;

        const duration = 500;
        const difference = totalCost - animatedTotal;

        const step = (timestamp: number) => {
            if (!start) start = timestamp;
            const progress = timestamp - start;
            const progressRatio = Math.min(progress / duration, 1);
            setAnimatedTotal(animatedTotal + difference * progressRatio);
            if (progress < duration) {
                animationFrameId = requestAnimationFrame(step);
            } else {
                setAnimatedTotal(totalCost);
            }
        };

        animationFrameId = requestAnimationFrame(step);

        return () => cancelAnimationFrame(animationFrameId);
    }, [totalCost]);

    useEffect(() => {
        previousTotalRef.current = totalCost;
    }, [totalCost]);

    useEffect(() => {
        const nextTotals: Record<string, number> = {};
        cart.forEach((item) => {
            nextTotals[item.itemKey] = item.price * item.quantity;
        });
        itemTotalsRef.current = nextTotals;
    }, [cart]);

    useEffect(() => {
        if (craftingRecipes.length > 0) {
            setSelectedRecipe(craftingRecipes[0]);
        } else {
            setSelectedRecipe(null);
        }
    }, [craftingRecipes]);

    useEffect(() => {
        if (craftingInProgress || craftQueue.length === 0 || !rightInventory?.id) return;

        const processCraft = async () => {
            setCraftingInProgress(true);
            setCurrentCraftProgress(0);
            cancelledRef.current = false;
            
            const currentItem = craftQueue[0];
            const recipe = currentItem.recipe;
            const duration = recipe.duration || 3000;

            const recipeId = craftingRecipes.findIndex(r => r.name === recipe.name) + 1;

            if (recipeId <= 0) {
                console.error('Recipe not found');
                setCraftQueue(prev => prev.slice(1));
                setCraftingInProgress(false);
                return;
            }

            const startTime = Date.now();
            const progressInterval = window.setInterval(() => {
                const elapsed = Date.now() - startTime;
                const progress = Math.min((elapsed / duration) * 100, 100);
                setCurrentCraftProgress(progress);
            }, 16);
            
            progressIntervalRef.current = progressInterval;

            await new Promise<void>(resolve => {
                const timeout = window.setTimeout(() => resolve(), duration);
                craftTimeoutRef.current = timeout;
            });

            if (cancelledRef.current) {
                clearInterval(progressInterval);
                progressIntervalRef.current = null;
                craftTimeoutRef.current = null;
                setCurrentCraftProgress(0);
                setCraftingInProgress(false);
                return;
            }

            clearInterval(progressInterval);
            progressIntervalRef.current = null;
            craftTimeoutRef.current = null;
            setCurrentCraftProgress(100);

            try {
                const response = await fetchNui<any>('craftFromCraftingInventory', {
                    benchId: rightInventory.id,
                    recipeId: recipeId,
                    quantity: currentItem.quantity,
                });

                if (response?.success) {
                    console.log('Craft successful');
                } else {
                    console.error('Craft failed:', response?.error);
                }
            } catch (error) {
                console.error('Craft request failed:', error);
            }

            setCraftQueue(prev => prev.slice(1));
            setCurrentCraftProgress(0);
            setCraftingInProgress(false);
        };

        processCraft();
    }, [craftQueue, craftingInProgress, rightInventory?.id, craftingRecipes]);

    useEffect(() => {
        return () => {
            if (progressIntervalRef.current) {
                clearInterval(progressIntervalRef.current);
            }
            if (craftTimeoutRef.current) {
                clearTimeout(craftTimeoutRef.current);
            }
        };
    }, []);

    useNuiEvent('closeInventory', () => {
        if (rightInventory?.type === 'crafting' && craftQueue.length > 0) {
            if (progressIntervalRef.current) {
                clearInterval(progressIntervalRef.current);
                progressIntervalRef.current = null;
            }
            if (craftTimeoutRef.current) {
                clearTimeout(craftTimeoutRef.current);
                craftTimeoutRef.current = null;
            }

            const queueData = craftQueue.map((item, index) => {
                const recipeId = craftingRecipes.findIndex(r => r.name === item.recipe.name) + 1;
                return {
                    recipeId: recipeId,
                    quantity: item.quantity,
                    duration: item.recipe.duration || 3000,
                    isCurrentlyCrafting: index === 0 && craftingInProgress,
                    currentProgress: index === 0 ? currentCraftProgress : 0,
                };
            });

            if (queueData[0] && queueData[0].isCurrentlyCrafting && queueData[0].currentProgress > 0) {
                const remainingTime = queueData[0].duration * (1 - queueData[0].currentProgress / 100);
                queueData[0].duration = Math.max(100, remainingTime); // Minimum 100ms
            }

            fetchNui('startCraftQueue', { benchId: rightInventory.id, queue: queueData }).catch((error) => {
                console.error('Failed to start craft queue:', error);
            });

            setCraftQueue([]);
            setCraftingInProgress(false);
            setCurrentCraftProgress(0);
        }
    });

    if (!rightInventory) return null;

    const { type } = rightInventory;
    const hideExtras = type === 'shop';

    const getItemCount = (itemName: string): number => {
        if (!craftingInventory?.items || !Array.isArray(craftingInventory.items)) return 0;
        
        try {
            return craftingInventory.items.reduce((total, slot) => {
                if (slot && slot.name === itemName) {
                    return total + (slot.count || 1);
                }
                return total;
            }, 0);
        } catch (error) {
            console.error('Error counting items:', error);
            return 0;
        }
    };

    const hasEnoughMaterials = useMemo(() => {
        if (!selectedRecipe) return false;
        
        return Object.entries(selectedRecipe.ingredients).every(([itemName, ingredient]) => {
            const currentCount = getItemCount(itemName);
            const requiredQty = ingredient.qty * recipeQuantity;
            return currentCount >= requiredQty;
        });
    }, [selectedRecipe, recipeQuantity]);

    const addToQueue = () => {
        if (!selectedRecipe) return;

        if (!hasEnoughMaterials) {
            console.error('Not enough materials to craft this item');
            return;
        }

        setCraftQueue((prev) => [...prev, { recipe: selectedRecipe, quantity: recipeQuantity }]);
        setRecipeQuantity(1);
    };

    const removeFromQueue = (index: number) => {
        if (index === 0 && craftingInProgress) {
            cancelledRef.current = true;
            
            if (progressIntervalRef.current) {
                clearInterval(progressIntervalRef.current);
                progressIntervalRef.current = null;
            }
            if (craftTimeoutRef.current) {
                clearTimeout(craftTimeoutRef.current);
                craftTimeoutRef.current = null;
            }
            
            setCurrentCraftProgress(0);
            setCraftingInProgress(false);
        }
        
        setCraftQueue((prev) => prev.filter((_, i) => i !== index));
    };

    const addToCart = (item: ShopItem) => {
        const itemKey = item.name + (item.slot ?? '');
        const itemName = item.metadata?.label || item.name;
        const itemPrice = item.price ?? 0;
        const itemImage = getItemUrl(item.name);
        const audio = new Audio(dragSound);

        audio.volume = 0.25;
        
        audio.play(); // Do people still want sound effects?

        setCart((prev) => {
            const existing = prev.find((i) => i.itemKey === itemKey);
            if (existing) {
                return prev.map((i) =>
                    i.itemKey === itemKey ? { ...i, quantity: i.quantity + 1 } : i
                );
            }
            return [...prev, { itemKey, name: itemName, price: itemPrice, quantity: 1, image: itemImage }];
        });
    };

    const [{ isOver, canDrop }, drop] = useDrop<DragSource & { item: ShopItem }, void, { isOver: boolean; canDrop: boolean }>(
        () => ({
            accept: 'SLOT',
            canDrop: (source) => source.inventory === InventoryType.SHOP,
            drop: (source) => {
                if (!source.item) return;
                addToCart(source.item);
            },
        }),
        [cart]
    );

    const removeFromCart = (itemKey: string) => setCart((prev) => prev.filter((i) => i.itemKey !== itemKey));

    const changeQuantity = (itemKey: string, delta: number) =>
        setCart(prev =>
            prev.map(i => {
                if (i.itemKey !== itemKey) return i

                const nextQty = i.quantity + delta
                return { ...i, quantity: Math.max(1, nextQty) }
            })
        );


    const pay = (method: 'cash' | 'bank') => {
        if (cart.length === 0) return;

        const itemsPayload = cart.map((item) => ({
            name: item.name,
            quantity: item.quantity,
            price: item.price,
        }));

        fetchNui('buyItems', { items: itemsPayload, method: method })
    };

    return (
        <div className={`right-inventory ${type === 'shop' ? 'right-inventory-shop' : ''}`}>
            <AnimatePresence>
                {rightInventory && type !== "crafting" && (
                    <div key={rightInventory.type} className="inventory-item">
                        <motion.div>
                            <InventoryGrid
                                inventory={rightInventory}
                                hideExtras={hideExtras}
                                noWrapper={false}
                                onCtrlClick={addToCart}
                            />
                        </motion.div>
                    </div>
                )}

                {/* Shopping cart appears from bottom */}
                {type === 'shop' && (
                    <motion.div 
                        ref={drop} 
                        key="shopping-cart" 
                        initial={{ y: 100, opacity: 0 }}
                        animate={{ y: 0, opacity: 1 }}
                        exit={{ y: 100, opacity: 0 }}
                        transition={{ duration: 0.4, ease: 'easeOut' }}
                        className={`inventory-grid-wrapper shopping-cart ${isOver && canDrop ? 'highlight' : ''}`}
                    >
                        <a style={{ 
                            fontSize: '1.5vh', 
                            fontWeight: '600', 
                            paddingBottom: '0.5rem', 
                            paddingTop: '0.5rem' }}
                        >Shopping Cart</a>

                        {cart.length === 0 && 
                            <div className="no-items">
                                <i className="fa-regular fa-square-plus"></i>
                                <p>DRAG SHOP ITEMS HERE<a>ALTERNATIVELY, DOUBLE CLICK OR SHIFT + CLICK</a></p>
                            </div>
                        }

                        <div className="cart-item-grid">
                            {cart.map((item) => {
                                return (
                                    <div className="cart-item inventory-slot">
                                        { item.image && <img src={item.image} alt={item.name} /> }
                                        
                                        <div className="cart-info">
                                            <p>{item.name}</p>
                                            
                                            <div className="cart-controls">
                                                
                                                <button className='cart-controls-buttons' onClick={() => changeQuantity(item.itemKey, -1)}>
                                                    <i className="fal fa-minus" />
                                                </button>

                                                <span className='cart-controls-qty'>{item.quantity}</span>

                                                <button className='cart-controls-buttons' onClick={() => changeQuantity(item.itemKey, 1)}>
                                                    <i className="fal fa-plus" />
                                                </button>

                                                <button className='cart-controls-buttons' onClick={() => removeFromCart(item.itemKey)}>
                                                    <i className="fal fa-trash" />
                                                </button>
                                            </div>
                                        </div>

                                        <span>${(item.price * item.quantity).toFixed(2)}</span>
                                    </div>
                                );
                            })}
                        </div>

                        <div className="cart-footer">
                            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                                <a>Total:</a>
                                <p style={{ fontSize: '1vw' }}>${animatedTotal.toFixed(2)}</p>
                            </div>

                            <div style={{ display: 'flex', gap: '1rem', justifyContent: 'end' }}>

                                <button className='shopping-cart-buttons' onClick={() => pay('bank')}>
                                    <i className="hgi hgi-stroke hgi-credit-card"></i>
                                    <p>Pay Bank</p>
                                </button>

                                <button className='shopping-cart-buttons' onClick={() => pay('cash')}>
                                    <i className="hgi hgi-stroke hgi-coins-02"></i>
                                    <p>Pay Cash</p>
                                </button>
                            </div>
                        </div>
                    </motion.div>
                )}

                {type === "crafting" && (
                    <motion.div
                        ref={drop}
                        key="crafting-recipes"
                        initial={{ y: 100, opacity: 0 }}
                        animate={{ y: 0, opacity: 1 }}
                        exit={{ y: 100, opacity: 0 }}
                        transition={{ duration: 0.4, ease: 'easeOut' }}
                        style={{ width: '50vh' }}
                        className={`inventory-grid-wrapper crafting-grid ${isOver && canDrop ? "highlight" : ""}`}
                    >
                        <h3>Crafting</h3>

                        <div className="crafting-container">
                            <div style={{
                                display: 'grid',
                                gridTemplateColumns: 'repeat(4, 1fr)',
                                justifyContent: 'space-between',
                                gap: '1vh',
                                maxHeight: '12vh',
                                overflow: 'hidden',
                                overflowY: 'auto',
                                paddingRight: '0.5rem',
                            }}>
                                {craftingRecipes.map((recipe, i) => (
                                    <div
                                        key={i}
                                        className={`recipe-item ${selectedRecipe?.name === recipe.name ? "selected" : ""}`}
                                        style={{
                                            backgroundColor: selectedRecipe?.name === recipe.name ? 'rgba(119,222,185,0.2)' : 'transparent',
                                            border: selectedRecipe?.name === recipe.name ? '1px solid #77deb9' : '1px solid rgba(255, 255, 255, 0.1)',
                                            display: 'flex',
                                            justifyContent: 'center',
                                            alignItems: 'center',
                                            position: 'relative',
                                            borderRadius: '0.5rem',
                                            width: '10.8vh',
                                            height: '11.1vh',
                                        }}
                                        onClick={() => setSelectedRecipe(recipe)}
                                    >
                                        <img
                                            src={getItemUrl(toAsciiLower(recipe.name))}
                                            alt={recipe.name}
                                            style={{ width: "4vh", height: "4vh", objectFit: "cover", position: 'absolute' }}
                                        />
                                        <div style={{
                                            display: 'flex',
                                            textAlign: 'center',
                                            position: 'absolute',
                                            bottom: '0.5rem',
                                            fontWeight: '600',
                                            fontSize: '1.1vh',
                                        }}>
                                            <p>{recipe.label || recipe.name}</p>
                                        </div>
                                        <p style={{
                                            position: 'absolute',
                                            top: '0.5vh',
                                            right: '0.5vh',
                                            fontSize: '1vh',
                                            backgroundColor: 'rgba(0,0,0,0.5)',
                                            display: 'flex',
                                            alignItems: 'center',
                                            justifyContent: 'center',
                                            width: '2vh',
                                            height: '2vh',
                                            borderRadius: '100%',
                                            border: '1px solid rgba(255,255,255,0.3)',

                                        }}>{recipe.count}</p>
                                    </div>
                                ))}
                            </div>

                            <div className="recipe-details">
                                {selectedRecipe && selectedRecipe.name ? (
                                    <>
                                        <div style={{
                                            width: '100%', 
                                            height: '0.1rem', 
                                            marginTop: '1rem', 
                                            backgroundColor: 'rgba(255,255,255,0.1)',
                                        }} />

                                        <div style={{
                                            display: 'flex',
                                            justifyContent: 'space-between',
                                            alignItems: 'center',
                                            width: '100%',
                                        }}>
                                            <div style={{ display: 'flex', alignItems: 'center', gap: '1vh' }}>
                                                <a style={{
                                                    fontSize: '3vh',
                                                    marginTop: '1rem',
                                                    fontWeight: '600',
                                                    display: 'flex',
                                                }}>
                                                    {selectedRecipe.label || selectedRecipe.name}
                                                </a>
                                            </div>

                                            <div>
                                                <p style={{
                                                    fontWeight: '400',
                                                    fontSize: '1vh',
                                                    color: 'rgba(255,255,255,0.5)',
                                                }}>Quantity</p>
                                                <a style={{
                                                    marginTop: '0.5vh',
                                                    display: 'flex',
                                                    fontWeight: '600',
                                                }}>{selectedRecipe.count}</a>
                                            </div>
                                        </div>

                                        <p style={{
                                            display: 'flex',
                                            alignItems: 'center',
                                            gap: '1rem',
                                            color: 'rgba(255,255,255,0.5)',
                                            fontWeight: '500',
                                        }}>
                                            CRAFTING TIME:
                                            <a style={{
                                                color: 'rgba(255,255,255)',
                                                fontSize: '1.25vh',
                                                backgroundColor: 'rgba(119,222,185,0.2)',
                                                display: 'flex',
                                                alignItems: 'center',
                                                justifyContent: 'center',
                                                padding: '0.5rem 0.85rem',
                                                borderRadius: '0.35rem',
                                                border: '1px solid rgba(119,222,185)',
                                            }}>
                                                {selectedRecipe.duration / 1000}s
                                            </a>
                                        </p>

                                        <a style={{
                                            marginTop: '1.5rem',
                                            display: 'flex',
                                            fontSize: '1vh',
                                            color: 'rgba(255,255,255,0.5)',
                                        }}>Items Required</a>

                                        <div className="ingredients-grid" style={{
                                            display: 'flex',
                                            gap: '1vh',
                                            marginTop: '0.5rem',
                                        }}>
                                            {selectedRecipe.ingredients && typeof selectedRecipe.ingredients === 'object' && Object.entries(selectedRecipe.ingredients).map(([itemName, info]) => (
                                                <div key={itemName} className="ingredient-slot inventory-slot" style={{
                                                    backgroundColor: 'rgba(0,0,0,0.5)',
                                                    border: '1px solid rgba(255,255,255,0.15)',
                                                    display: 'flex',
                                                    justifyContent: 'center',
                                                    alignItems: 'center',
                                                    position: 'relative',
                                                    borderRadius: '0.5rem',
                                                    width: '5vh',
                                                    height: '4.5vh',
                                                }}>
                                                    <img
                                                        src={getItemUrl(toAsciiLower(itemName))}
                                                        alt={info.label}
                                                        style={{ width: "4vh", objectFit: "contain", position: 'absolute' }}
                                                    />
                                                    <div className="ingredient-info">
                                                        <span style={{
                                                            color: getItemCount(itemName) >= info.qty * recipeQuantity ? '#77deb9' : 'rgba(255,99,71,0.8)',
                                                            position: 'absolute',
                                                            fontSize: '1vh',
                                                            bottom: '0.5vh',
                                                            right: '0.8vh',
                                                            fontWeight: '600',
                                                        }}>
                                                            {getItemCount(itemName)}/{info.qty * recipeQuantity}
                                                        </span>
                                                    </div>
                                                </div>
                                            ))}
                                        </div>

                                        <div className="Queue" style={{
                                            color: 'rgba(255,255,255)',
                                            display: 'flex',
                                            marginTop: '1.5rem',
                                            width: '100%',
                                            justifyContent: 'space-between',
                                            alignItems: 'center',
                                        }}>
                                            <div style={{
                                                display: 'flex',
                                                flexDirection: 'column',
                                                gap: '0.5rem',
                                            }}>
                                                <a style={{
                                                    color: 'rgba(255,255,255,0.5)',
                                                    fontSize: '1vh',
                                                }}>Quantity</a>
                                                <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', gap: '0.5rem', backgroundColor: 'rgba(0,0,0,0.5)', padding: '0.5rem', border: '1px solid rgba(255,255,255,0.25)', borderRadius: '0.5rem' }}>
                                                    <button style={{ color: 'white', background: 'transparent', border: 'none', cursor: 'pointer' }} onClick={() => setRecipeQuantity(Math.max(1, recipeQuantity - 1))}><i className="fas fa-minus"></i></button>
                                                    <span style={{
                                                        display: 'flex',
                                                        justifyContent: 'center',
                                                        width: '4rem',
                                                    }}>{recipeQuantity}</span>
                                                    <button style={{ color: 'white', background: 'transparent', border: 'none', cursor: 'pointer' }} onClick={() => setRecipeQuantity(recipeQuantity + 1)}><i className="fas fa-plus"></i></button>
                                                </div>
                                            </div>

                                            <button onClick={addToQueue} style={{
                                                color: 'rgba(255,255,255)',
                                                width: '60%',
                                                backgroundColor: hasEnoughMaterials ? 'rgba(119,222,185,0.2)' : 'rgba(0, 0, 0, 0.5)',
                                                border: hasEnoughMaterials ? '1px solid #77deb9' : '1px solid rgba(255,255,255,0.15)',
                                                borderRadius: '0.5rem',
                                                padding: '1.5rem',
                                                fontSize: '1.25vh',
                                                fontWeight: '600',
                                                transition: 'background-color 0.3s, border 0.3s',
                                                cursor: hasEnoughMaterials ? 'pointer' : 'not-allowed',
                                            }}>
                                                Add to Queue
                                            </button>
                                        </div>

                                        {/* Craft Queue */}
                                        <div style={{
                                            width: '100%',
                                            height: '0.1rem',
                                            marginTop: '1rem',
                                            backgroundColor: 'rgba(255,255,255,0.1)',
                                        }}></div>
                                        <a style={{
                                            marginTop: '1rem',
                                            display: 'flex',
                                            fontSize: '1.2vh',
                                            color: 'rgba(255,255,255,0.5)',
                                            fontWeight: '500',
                                        }}>Crafting Queue</a>
                                        {craftQueue.length > 0 && (
                                            <div style={{
                                                display: 'flex',
                                                gap: '1vh',
                                                flexWrap: 'wrap',
                                                marginTop: '1rem',
                                                maxHeight: '13vh',
                                                overflow: 'hidden',
                                                overflowY: 'auto',
                                            }}>
                                                {craftQueue.map((q, idx) => (
                                                    <div key={idx} style={{ display: 'flex', alignItems: 'center', gap: '1vh', marginTop: '0.5rem' }}>
                                                        <div style={{
                                                            display: 'flex',
                                                            position: 'relative',
                                                            alignItems: 'center',
                                                            justifyContent: 'center',
                                                            flexDirection: 'column',
                                                            gap: '1vh',
                                                            backgroundColor: 'rgba(0,0,0,0.5)',
                                                            border: '1px solid rgba(255,255,255,0.15)',
                                                            padding: '0.5rem 1rem',
                                                            borderRadius: '0.5rem',
                                        
                                                            width: '9vh',
                                                            height: '9vh',
                                                        }}>
                                                        <img src={getItemUrl(toAsciiLower(q.recipe.name))} alt={q.recipe.label} style={{ 
                                                            width: '5vh', 
                                                            objectFit: 'contain',
                                                            }} />
                                                        <span style={{
                                                            display: 'flex',
                                                            justifyContent: 'space-between',
                                                            width: '9.5vh',
                                                            top: '0.5rem',
                                                            fontWeight: '600',
                                                            fontSize: '1.15vh',
                                                            alignItems: 'center',
                                                            position: 'absolute',
                                                        }}>{q.recipe.label} <a>x{q.quantity}</a></span>

                                                        {/* Progress & Cancel */}
                                                        <div style={{
                                                            display: 'flex',
                                                            alignItems: 'center',
                                                            position: 'absolute',
                                                            bottom: '0.75rem',
                                                            width: '9.5vh',
                                                            justifyContent: 'space-between',
                                                        }}>
                                                            {idx === 0 && craftingInProgress ? (
                                                                <CircularProgress progress={progress || 0} />
                                                            ) : (
                                                                <CircularProgress progress={0} />
                                                            )}
                
                                                            <div onClick={() => removeFromQueue(idx)}
                                                                style={{
                                                                    position: 'absolute',
                                                                    top: '0.4rem',
                                                                    right: '0.0rem',
                                                                    color: 'rgba(255,255,255,0.25)',
                                                                    cursor: 'pointer',
                                                                    fontSize: '1.2vh',
                                                                }}
                                                            >
                                                                <i className="fal fa-circle-x"></i>
                                                            </div>
                                                        </div>
                                                        </div>
                                                    </div>
                                                ))}
                                            </div>
                                        )}
                                        {craftQueue.length === 0 && (
                                            <p style={{ marginTop: '1rem', color: 'rgba(255,255,255,0.5)' }}>No items in queue</p>
                                        )}
                                    </>
                                ) : (
                                    <p>Select a recipe</p>
                                )}
                            </div>

                        </div>
                    </motion.div>
                )}
            </AnimatePresence>
        </div>
    );
};

export default RightInventory;
