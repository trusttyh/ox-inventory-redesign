import InventoryComponent from './components/inventory';
import useNuiEvent from './hooks/useNuiEvent';
import { Items } from './store/items';
import { Locale } from './store/locale';
import { setImagePath } from './store/imagepath';
import { setupInventory } from './store/inventory';
import { Inventory } from './typings';
import { useAppDispatch } from './store';
import { debugData } from './utils/debugData';
import DragPreview from './components/utils/DragPreview';
import { fetchNui } from './utils/fetchNui';
import { useDragDropManager } from 'react-dnd';
import KeyPress from './components/utils/KeyPress';
import { setUtilitySlotRestrictions } from './utils/utilitySlotValidation';

debugData([
  {
    action: 'itemNotify',
    data: [{ slot: 1, name: 'water', weight: 3000, count: 5, metadata: {} }, 'ui_added', 5],
  },
  {
    action: 'itemNotify',
    data: [{ slot: 2, name: 'water', weight: 0, count: 1, metadata: { durability: 75 } }, 'ui_removed', 1],
  },
  {
    action: 'itemNotify',
    data: [
      { slot: 3, name: 'weapon_pistol', weight: 1000, count: 1, metadata: { durability: 100 } },
      'ui_holstered',
      1,
    ],
  },

  {
    action: 'toggleHotbar',
    data: {},
  },

  {
    action: 'setupInventory',
    data: {
      leftInventory: {
        id: 'test',
        type: 'player',
        slots: 8,
        label: 'AutLaaw Dev',
        weight: 3000,
        maxWeight: 5000,
        items: [
          {
            slot: 1,
            name: 'weapon_pistolxm3',
            rarity: 'common',
            weight: 3000,
            metadata: {
              description: `Name: Svetozar Miletic  \n Gender: Male`,
              durability: 85,
            },
            count: 1,
          },
          {
            slot: 2,
            name: 'weapon_advancedrifle',
            weight: 0,
            count: 1,
            rarity: 'uncommon',
            metadata: {
              durability: 85,
            },
          },
          { slot: 3, name: 'Rum', weight: 100, count: 12, rarity: 'rare', metadata: { type: 'Special', durability: 85 } },
          {
            slot: 4,
            name: 'water',
            weight: 100,
            count: 5,
            rarity: 'epic',
            metadata: {
              durability: 85,
            },
          },
          {
            slot: 5,
            name: 'bandage',
            weight: 100,
            count: 1,
            rarity: 'objective',
            metadata: {
              durability: 85,
            },
          },
          {
            slot: 6,
            name: 'military_backpack',
            weight: 100,
            count: 1,
            rarity: 4,
            metadata: {
              durability: 85,
            },
          },
          {
            slot: 7,
            name: 'Armor',
            weight: 100,
            count: 1,
            rarity: 'mythic',
            metadata: {
              durability: 85,
            },
          },
          {
            slot: 8,
            name: 'Phone',
            weight: 100,
            count: 1,
            rarity: 'common',
            metadata: {
              durability: 85,
            },
          },
          {
            slot: 9,
            name: 'parachute',
            weight: 100,
            count: 1,
            rarity: 'epic',
            metadata: {
              durability: 85,
            },
          },
          {
            slot: 10,
            name: 'cloth',
            weight: 100,
            count: 3,
            rarity: 'common',
            metadata: {
              durability: 85,
            },
          },
          {
            slot: 11,
            name: 'scrapmetal',
            weight: 100,
            count: 5,
            rarity: 'common',
            metadata: {
              durability: 85,
            },
          },
        ],
      },
      rightInventory: {
        id: 'drop_123',
        type: 'ground',
        slots: 40,
        label: 'Drop',
        weight: 0,
        maxWeight: 10000,
        items: [
          {
            slot: 1,
            name: 'water',
            weight: 100,
            count: 10,
          },
          {
            slot: 2,
            name: 'lockpick',
            weight: 500,
            count: 3,
          },
          {
            slot: 3,
            name: 'goldchain',
            weight: 250,
            count: 1,
            rarity: 'epic',
          },
        ],
      },
      backpackInventory: {
        id: 'backpack_demo',
        type: 'backpack',
        slots: 8,
        label: 'Backpack',
        weight: 800,
        maxWeight: 4000,
        items: [],
      },
      craftingInventory: {
        id: 'crafting_1738',
        type: 'crafting_storage',
        slots: 50,
        label: 'Crafting Storage',
        weight: 1200,
        maxWeight: 5000,
        items: [
          { slot: 1, name: 'sign_rightturn', count: 5, weight: 200 },
          { slot: 2, name: 'sign_stop', count: 5, weight: 200 },
          { slot: 3, name: 'sign_uturn', count: 5, weight: 200 },
          { slot: 4, name: 'sign_walkingman', count: 5, weight: 200 },
          { slot: 5, name: 'sign_yield', count: 5, weight: 200 },
        ],
      },
    },
  },
  {
    action: 'setupInventory',
    data: {
      rightInventory: {
        id: '1738',
        type: 'crafting',
        slots: 8,
        label: 'Hidden Cache',
        weight: 1200,
        maxWeight: 5000,
        items: [
          {
            name: 'ironbar',
            ingredients: {
              sign_dontblock: 5,
              sign_leftturn: 5,
              sign_nopark: 5,
              sign_notresspass: 5,
            },
            duration: 5000,
            count: 50,
          },
          {
            name: 'scrapmetal',
            ingredients: {
              sign_rightturn: 5,
              sign_stop: 5,
              sign_uturn: 5,
              sign_walkingman: 5,
              sign_yield: 5,
            },
            duration: 5000,
            count: 75,
          }
        ],
      },
    },
  },
]);

const App: React.FC = () => {
  const dispatch = useAppDispatch();
  const manager = useDragDropManager();

  useNuiEvent<{
    locale: { [key: string]: string };
    items: typeof Items;
    leftInventory: Inventory;
    imagepath: string;
  }>('init', ({ locale, items, leftInventory, imagepath }) => {
    for (const name in locale) Locale[name] = locale[name];
    for (const name in items) Items[name] = items[name];

    setImagePath(imagepath);
    dispatch(setupInventory({ leftInventory }));

    fetchNui('uiLoaded', {}).catch((error) => {
      console.warn('Failed to call uiLoaded:', error);
    });

    fetchNui('fetchSlotRestrictions', {})
      .then((restrictions: any) => {
        if (restrictions && typeof restrictions === 'object') {
          setUtilitySlotRestrictions(restrictions);
        }
      })
      .catch((error) => {
        console.warn('Failed to fetch slot restrictions:', error);
      });
  });

  useNuiEvent('closeInventory', () => {
    manager.dispatch({ type: 'dnd-core/END_DRAG' });
  });

  useNuiEvent<{
    backpackInventory: Inventory;
  }>('refreshBackpackInventory', ({ backpackInventory }) => {
    dispatch(setupInventory({ backpackInventory }));
  });

  return (
    <div className="app-wrapper">
      <InventoryComponent />
      <DragPreview />
      <KeyPress />
    </div>
  );
};

addEventListener('dragstart', function (event) {
  event.preventDefault();
});

export default App;
