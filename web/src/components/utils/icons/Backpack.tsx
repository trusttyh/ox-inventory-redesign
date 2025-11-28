export const Backpack: React.FC = () => {
  return (
    <svg width="64" height="64" viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path
        d="M14 12 C14 6, 50 6, 50 12 V50 C50 56, 14 56, 14 50 V12 Z"
        stroke="#707070"
        strokeWidth={3}
        strokeLinejoin="round"
        strokeLinecap="round"
        fill="none"
      />

      <path d="M14 14 Q32 8, 50 14" stroke="#707070" strokeWidth={2.8} strokeLinecap="round" fill="none" />

      <rect x="20" y="34" width="24" height="12" rx="3" stroke="#707070" strokeWidth={2.8} fill="none" />
      <path d="M24 40 H40" stroke="#707070" strokeWidth={2.5} strokeLinecap="round" />

      <path d="M10 34 V46 C10 50, 12 54, 16 54" stroke="#707070" strokeWidth={2.5} strokeLinecap="round" fill="none" />
      <path d="M54 34 V46 C54 50, 52 54, 48 54" stroke="#707070" strokeWidth={2.5} strokeLinecap="round" fill="none" />

      <path d="M40 34 C41 35, 43 35, 44 34" stroke="#707070" strokeWidth={2} strokeLinecap="round" fill="none" />
      <circle cx="44" cy="34" r="1" fill="#707070" />
    </svg>
  );
};

export default Backpack;
