export const Rarity: {
    [key: string]: string
} = {
    common: 'rgba(171, 171, 171, 1)',
    uncommon: 'rgba(162, 202, 49, 1)',
    rare: 'rgba(54, 196, 174, 1)',
    epic: 'rgba(179, 64, 220, 1)',
    objective: 'rgba(232, 186, 48, 1)',
    legendary: 'rgba(255, 173, 0, 1)',
    mythic: 'rgba(255, 0, 82, 1)',
}

const rarityNumberMap: { [key: number]: string } = {
    1: 'common',
    2: 'uncommon',
    3: 'rare',
    4: 'epic',
    5: 'legendary',
    7: 'mythic',
}

export const getRarityKey = (rarity: string | number | null | undefined): string => {
    if (!rarity && rarity !== 0) return 'common';
    
    if (typeof rarity === 'number') {
        return rarityNumberMap[rarity] || 'common';
    }

    if (typeof rarity === 'string') {
        return rarity.toLowerCase();
    }
    
    return 'common';
}

export const getRarityDisplayName = (rarity: string | number | null | undefined): string => {
    const key = getRarityKey(rarity);
    if (!key) return 'common';
    
    return key.charAt(0).toUpperCase() + key.slice(1);
}
